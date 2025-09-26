import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirestoreService {
  final FirebaseFirestore firestore;

  FirestoreService({required this.firestore});

  Future<List<Map<String, dynamic>>> getDocumentsInCollection({
    required String collection,
    String? orderBy,
    bool descending = false,
    String? subCollection,
    String? filterKey,
    String? filterValue,
  }) async {
    try {
      Query query = firestore.collection(collection);

      if (filterKey != null && filterValue != null) {
        query = query.where(filterKey, isEqualTo: filterValue);
      }

      if (orderBy != null) {
        query = query.orderBy(orderBy, descending: descending);
      }

      final querySnapshot = await query.get();

      List<Map<String, dynamic>> documents =
          querySnapshot.docs.map((doc) {
            return {'id': doc.id, ...doc.data() as Map<String, dynamic>};
          }).toList();

      if (subCollection != null) {
        return await Future.wait(
          documents.map((data) async {
            final docRef = firestore.collection(collection).doc(data['id']);
            final subCollectionSnapshot =
                await docRef.collection(subCollection).get();
            List<Map<String, dynamic>> subData =
                subCollectionSnapshot.docs.map((e) {
                  return {'id': e.id, ...e.data()};
                }).toList();
            return {...data, subCollection: subData};
          }),
        );
      }

      return documents;
    } catch (ex) {
      throw FirebaseException(
        plugin: 'FirebaseFirestore',
        message: 'An error occurred while fetching data',
        stackTrace: StackTrace.current,
      );
    }
  }

  Future<Map<String, dynamic>> getDocumentInCollection({
    required String collection,
    required String document,
    String? subCollection,
  }) async {
    try {
      final docSnapshot =
          await firestore.collection(collection).doc(document).get();
      if (docSnapshot.exists) {
        final data = {
          'id': docSnapshot.id,
          ...docSnapshot.data() as Map<String, dynamic>,
        };
        if (subCollection != null) {
          final subCollectionSnapshot =
              await firestore
                  .collection(collection)
                  .doc(document)
                  .collection(subCollection)
                  .get();

          final subCollectionData =
              subCollectionSnapshot.docs.map((doc) {
                return {'id': doc.id, ...doc.data()};
              }).toList();
          data[subCollection] = subCollectionData;
        }
        return data;
      }
      return {};
    } catch (ex) {
      throw FirebaseException(
        plugin: 'FirebaseFirestore',
        message: 'An other error happened',
        stackTrace: StackTrace.current,
      );
    }
  }

  Future<bool> _checkDocumentExists({
    required String collection,
    required String document,
  }) async {
    DocumentSnapshot docSnapshot =
        await firestore.collection(collection).doc(document).get();
    return docSnapshot.exists;
  }

  Future<void> upsertUser({
    required String userId,
    required Map<String, dynamic> userData,
  }) async {
    CollectionReference users = firestore.collection('users');
    bool isUserExisted = await _checkDocumentExists(
      collection: 'users',
      document: userId,
    );
    if (isUserExisted) {
      debugPrint('update user $userId');
      try {
        // Set the document with the given uid.
        await users.doc(userId).update({...userData});
      } catch (e) {
        debugPrint(e.toString());
        throw FirebaseException(
          plugin: 'FirebaseFirestore',
          message: 'An other error happened',
          stackTrace: StackTrace.current,
        );
      }
    } else {
      debugPrint('create user $userId');
      try {
        // Set the document with the given uid.
        await users.doc(userId).set({
          ...userData,
          'createdAt': FieldValue.serverTimestamp(), // Adds a timestamp.
        });
      } catch (e) {
        debugPrint(e.toString());
        throw FirebaseException(
          plugin: 'FirebaseFirestore',
          message: 'An other error happened',
          stackTrace: StackTrace.current,
        );
      }
    }
  }

  Future<void> updateUserProgress({
    required String userId,
    required String progressId,
    required String exerciseType,
    String? exerciseId,
    int? totalExercises,
    String? lastAnswer,
    bool? isCorrect,
  }) async {
    try {
      // Reference to the progress document inside the user's "progress" sub collection.
      DocumentReference progressDocRef = firestore
          .collection('users')
          .doc(userId)
          .collection('progress')
          .doc(progressId);

      final baseData = {
        'exerciseType': exerciseType,
        'writeAt': FieldValue.serverTimestamp(),
      };

      if (totalExercises != null) {
        baseData['totalExercises'] = totalExercises;
      }

      await progressDocRef.set(baseData, SetOptions(merge: true));

      // Reference to the exercise document inside the progress document's "exercises" subcollection.
      if (exerciseId != null && lastAnswer != null && isCorrect != null) {
        final exerciseDocRef = progressDocRef
            .collection('exercises')
            .doc(exerciseId);

        // Insert the exercise document with the provided answer.
        await exerciseDocRef.set({
          'lastAnswer': lastAnswer,
          'isCorrect': isCorrect,
        }, SetOptions(merge: true));
      }

      debugPrint('Progress and exercise document added successfully.');
    } catch (e) {
      debugPrint('Error inserting progress document: $e');
    }
  }
}
