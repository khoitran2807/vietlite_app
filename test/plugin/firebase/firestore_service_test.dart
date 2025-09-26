import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/plugin/firebase/firestore_service.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/common_mocks.dart';

void main() {
  late FirestoreService firestoreService;
  late MockFirebaseFirestore mockFirestore;
  late MockCollectionReference mockCollectionReference;
  late MockQuerySnapshot mockQuerySnapshot;
  late MockQueryDocumentSnapshot mockQueryDocumentSnapshot;
  late MockDocumentReference mockDocumentReference;
  late MockDocumentSnapshot mockDocumentSnapshot;
  late MockCollectionReference mockSubCollectionReference;
  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    mockCollectionReference = MockCollectionReference();
    mockQuerySnapshot = MockQuerySnapshot();
    mockQueryDocumentSnapshot = MockQueryDocumentSnapshot();
    mockDocumentReference = MockDocumentReference();
    mockDocumentSnapshot = MockDocumentSnapshot();
    mockSubCollectionReference = MockCollectionReference();

    firestoreService = FirestoreService(firestore: mockFirestore);
  });

  group('getDocumentsInCollection', () {
    test('should apply ordering when orderBy is provided', () async {
      // Arrange
      when(
        () => mockFirestore.collection(any()),
      ).thenReturn(mockCollectionReference);
      when(
        () => mockCollectionReference.orderBy(any()),
      ).thenReturn(mockCollectionReference);
      when(
        () => mockCollectionReference.get(),
      ).thenAnswer((_) async => mockQuerySnapshot);
      when(
        () => mockQuerySnapshot.docs,
      ).thenReturn([mockQueryDocumentSnapshot]);
      when(() => mockQueryDocumentSnapshot.id).thenReturn('doc1');
      when(
        () => mockQueryDocumentSnapshot.data(),
      ).thenReturn({'title': 'Ordered Name'});

      // Act
      final result = await firestoreService.getDocumentsInCollection(
        collection: 'letters',
        orderBy: 'title',
      );

      // Assert
      expect(result, isA<List<Map<String, dynamic>>>());
      expect(result.length, 1);
      expect(result.first, {'id': 'doc1', 'title': 'Ordered Name'});

      // Verify that orderBy was called with the correct field
      verify(() => mockCollectionReference.orderBy('title')).called(1);
    });
    test('should return a list of documents when successful', () async {
      // Arrange
      when(
        () => mockFirestore.collection(any()),
      ).thenReturn(mockCollectionReference);
      when(
        () => mockCollectionReference.get(),
      ).thenAnswer((_) async => mockQuerySnapshot);
      when(
        () => mockQuerySnapshot.docs,
      ).thenReturn([mockQueryDocumentSnapshot]);
      when(() => mockQueryDocumentSnapshot.id).thenReturn('doc1');
      when(
        () => mockQueryDocumentSnapshot.data(),
      ).thenReturn({'title': 'Test Name'});

      // Act
      final result = await firestoreService.getDocumentsInCollection(
        collection: 'letters',
      );

      // Assert
      expect(result, isA<List<Map<String, dynamic>>>());
      expect(result.length, 1);
      expect(result.first, {'id': 'doc1', 'title': 'Test Name'});
    });

    test('should throw a FirebaseException on failure', () async {
      // Arrange
      when(
        () => mockFirestore.collection(any()),
      ).thenThrow(Exception('Error fetching data'));

      // Act & Assert
      expect(
        () => firestoreService.getDocumentsInCollection(collection: 'users'),
        throwsA(isA<FirebaseException>()),
      );
    });

    test(
      'should fetch subCollection data when subCollection is provided',
      () async {
        // Arrange
        final mockSubCollectionSnapshot = MockQuerySnapshot();
        final mockSubCollectionDoc = MockQueryDocumentSnapshot();

        when(
          () => mockFirestore.collection(any()),
        ).thenReturn(mockCollectionReference);
        when(
          () => mockCollectionReference.get(),
        ).thenAnswer((_) async => mockQuerySnapshot);
        when(
          () => mockQuerySnapshot.docs,
        ).thenReturn([mockQueryDocumentSnapshot]);
        when(() => mockQueryDocumentSnapshot.id).thenReturn('doc1');
        when(
          () => mockQueryDocumentSnapshot.data(),
        ).thenReturn({'title': 'Test Name'});

        // Mock DocumentReference
        final mockDocumentReference = MockDocumentReference();
        when(
          () => mockCollectionReference.doc('doc1'),
        ).thenReturn(mockDocumentReference);

        // Mock subcollection for the document
        when(
          () => mockDocumentReference.collection('exercises'),
        ).thenReturn(mockSubCollectionReference);
        when(
          () => mockSubCollectionReference.get(),
        ).thenAnswer((_) async => mockSubCollectionSnapshot);
        when(
          () => mockSubCollectionSnapshot.docs,
        ).thenReturn([mockSubCollectionDoc]);
        when(() => mockSubCollectionDoc.id).thenReturn('exercise1');
        when(
          () => mockSubCollectionDoc.data(),
        ).thenReturn({'exerciseName': 'Push Ups'});

        // Act
        final result = await firestoreService.getDocumentsInCollection(
          collection: 'letters',
          subCollection: 'exercises',
        );

        // Assert
        expect(result, isA<List<Map<String, dynamic>>>());
        expect(result.length, 1);
        expect(result.first, {
          'id': 'doc1',
          'title': 'Test Name',
          'exercises': [
            {'id': 'exercise1', 'exerciseName': 'Push Ups'},
          ],
        });
        // Verify that subcollection fetch is called
        verify(() => mockDocumentReference.collection('exercises')).called(1);
      },
    );

    test(
      'should apply filtering when filterKey and filterValue are provided',
      () async {
        // Arrange
        when(
          () => mockFirestore.collection(any()),
        ).thenReturn(mockCollectionReference);
        when(
          () => mockCollectionReference.where(
            any(),
            isEqualTo: any(named: 'isEqualTo'),
          ),
        ).thenReturn(mockCollectionReference);
        when(
          () => mockCollectionReference.get(),
        ).thenAnswer((_) async => mockQuerySnapshot);
        when(
          () => mockQuerySnapshot.docs,
        ).thenReturn([mockQueryDocumentSnapshot]);
        when(() => mockQueryDocumentSnapshot.id).thenReturn('doc1');
        when(
          () => mockQueryDocumentSnapshot.data(),
        ).thenReturn({'title': 'Filtered Name', 'category': 'science'});

        // Act
        final result = await firestoreService.getDocumentsInCollection(
          collection: 'letters',
          filterKey: 'category',
          filterValue: 'science',
        );

        // Assert
        expect(result, isA<List<Map<String, dynamic>>>());
        expect(result.length, 1);
        expect(result.first, {
          'id': 'doc1',
          'title': 'Filtered Name',
          'category': 'science',
        });

        // Verify that filtering is applied correctly
        verify(
          () => mockCollectionReference.where('category', isEqualTo: 'science'),
        ).called(1);
      },
    );
  });

  group('getDocumentInCollection', () {
    test(
      'should return document data without subCollection when successful',
      () async {
        // Arrange
        when(
          () => mockFirestore.collection(any()),
        ).thenReturn(mockCollectionReference);
        when(
          () => mockCollectionReference.doc(any()),
        ).thenReturn(mockDocumentReference);
        when(
          () => mockDocumentReference.get(),
        ).thenAnswer((_) async => mockDocumentSnapshot);
        when(() => mockDocumentSnapshot.exists).thenReturn(true);
        when(() => mockDocumentSnapshot.id).thenReturn('doc1');
        when(
          () => mockDocumentSnapshot.data(),
        ).thenReturn({'name': 'Test Name'});

        // Act
        final result = await firestoreService.getDocumentInCollection(
          collection: 'users',
          document: 'doc1',
        );

        // Assert
        expect(result, isA<Map<String, dynamic>>());
        expect(result, {'id': 'doc1', 'name': 'Test Name'});
      },
    );

    test(
      'should return document data with subCollection when successful',
      () async {
        // Arrange
        final mockSubCollectionReference = MockCollectionReference();
        final mockSubQuerySnapshot = MockQuerySnapshot();
        final mockSubQueryDocumentSnapshot = MockQueryDocumentSnapshot();

        when(
          () => mockFirestore.collection(any()),
        ).thenReturn(mockCollectionReference);
        when(
          () => mockCollectionReference.doc(any()),
        ).thenReturn(mockDocumentReference);
        when(
          () => mockDocumentReference.get(),
        ).thenAnswer((_) async => mockDocumentSnapshot);
        when(() => mockDocumentSnapshot.exists).thenReturn(true);
        when(() => mockDocumentSnapshot.id).thenReturn('doc1');
        when(
          () => mockDocumentSnapshot.data(),
        ).thenReturn({'name': 'Test Name'});

        // Mock subCollection
        when(
          () => mockDocumentReference.collection(any()),
        ).thenReturn(mockSubCollectionReference);
        when(
          () => mockSubCollectionReference.get(),
        ).thenAnswer((_) async => mockSubQuerySnapshot);
        when(
          () => mockSubQuerySnapshot.docs,
        ).thenReturn([mockSubQueryDocumentSnapshot]);
        when(() => mockSubQueryDocumentSnapshot.id).thenReturn('subDoc1');
        when(
          () => mockSubQueryDocumentSnapshot.data(),
        ).thenReturn({'subField': 'Sub Value'});

        // Act
        final result = await firestoreService.getDocumentInCollection(
          collection: 'users',
          document: 'doc1',
          subCollection: 'orders',
        );

        // Assert
        expect(result, {
          'id': 'doc1',
          'name': 'Test Name',
          'orders': [
            {'id': 'subDoc1', 'subField': 'Sub Value'},
          ],
        });

        verify(() => mockDocumentReference.collection('orders')).called(1);
      },
    );

    test('should return an empty map if the document does not exist', () async {
      // Arrange
      when(
        () => mockFirestore.collection(any()),
      ).thenReturn(mockCollectionReference);
      when(
        () => mockCollectionReference.doc(any()),
      ).thenReturn(mockDocumentReference);
      when(
        () => mockDocumentReference.get(),
      ).thenAnswer((_) async => mockDocumentSnapshot);
      when(() => mockDocumentSnapshot.exists).thenReturn(false);

      // Act
      final result = await firestoreService.getDocumentInCollection(
        collection: 'users',
        document: 'doc1',
      );

      // Assert
      expect(result, isEmpty);
    });

    test('should throw a FirebaseException on failure', () async {
      // Arrange
      when(
        () => mockFirestore.collection(any()),
      ).thenThrow(Exception('Error fetching document'));

      // Act & Assert
      expect(
        () => firestoreService.getDocumentInCollection(
          collection: 'users',
          document: 'doc1',
        ),
        throwsA(isA<FirebaseException>()),
      );
    });
  });

  group('updateUserProgress', () {
    const userId = 'user123';
    const progressId = 'progress456';
    const exerciseType = 'quiz';
    const exerciseId = 'exercise789';
    const lastAnswer = 'B';
    const isCorrect = true;
    const totalExercises = 1;

    setUp(() {
      when(
        () => mockFirestore.collection(any()),
      ).thenReturn(mockCollectionReference);
      when(
        () => mockCollectionReference.doc(any()),
      ).thenReturn(mockDocumentReference);
      when(
        () => mockDocumentReference.collection(any()),
      ).thenReturn(mockCollectionReference);
      when(
        () => mockDocumentReference.set(any(), any()),
      ).thenAnswer((_) async {});
    });

    test(
      'should successfully update user progress and exercise document',
      () async {
        await firestoreService.updateUserProgress(
          userId: userId,
          progressId: progressId,
          exerciseType: exerciseType,
          exerciseId: exerciseId,
          lastAnswer: lastAnswer,
          isCorrect: isCorrect,
          totalExercises: totalExercises,
        );

        verify(() => mockFirestore.collection('users')).called(1);
        verify(() => mockCollectionReference.doc(userId)).called(1);
        verify(() => mockDocumentReference.collection('progress')).called(1);
        verify(() => mockCollectionReference.doc(progressId)).called(1);
        when(
          () => mockDocumentReference.set(any(), any<SetOptions?>()),
        ).thenAnswer((_) async {});

        verify(() => mockCollectionReference.doc(exerciseId)).called(1);
        verify(
          () => mockDocumentReference.set({
            'lastAnswer': lastAnswer,
            'isCorrect': isCorrect,
          }, any()),
        ).called(1);
      },
    );

    test('should log error when Firestore operation fails', () async {
      when(
        () => mockDocumentReference.set(any(), any()),
      ).thenThrow(Exception('Firestore error'));

      await firestoreService.updateUserProgress(
        userId: userId,
        progressId: progressId,
        exerciseType: exerciseType,
        exerciseId: exerciseId,
        lastAnswer: lastAnswer,
        isCorrect: isCorrect,
        totalExercises: totalExercises,
      );

      verify(() => mockDocumentReference.set(any(), any())).called(1);
      verifyNever(() => mockCollectionReference.doc(exerciseId));
    });
  });

  group('FirestoreService', () {
    const userId = 'test_user';
    final userData = {'name': 'Test User', 'email': 'test@example.com'};

    test('should update user if document exists', () async {
      when(
        () => mockFirestore.collection('users'),
      ).thenReturn(mockCollectionReference);
      when(
        () => mockCollectionReference.doc(userId),
      ).thenReturn(mockDocumentReference);
      when(
        () => mockDocumentReference.get(),
      ).thenAnswer((_) async => mockDocumentSnapshot);
      when(() => mockDocumentSnapshot.exists).thenReturn(true);
      when(() => mockDocumentReference.update(any())).thenAnswer((_) async {});

      await firestoreService.upsertUser(userId: userId, userData: userData);

      verify(() => mockDocumentReference.update(userData)).called(1);
    });

    test('should create user if document does not exist', () async {
      when(
        () => mockFirestore.collection('users'),
      ).thenReturn(mockCollectionReference);
      when(
        () => mockCollectionReference.doc(userId),
      ).thenReturn(mockDocumentReference);
      when(
        () => mockDocumentReference.get(),
      ).thenAnswer((_) async => mockDocumentSnapshot);
      when(() => mockDocumentSnapshot.exists).thenReturn(false);
      when(() => mockDocumentReference.set(any())).thenAnswer((_) async {});

      await firestoreService.upsertUser(userId: userId, userData: userData);

      verify(
        () => mockDocumentReference.set({
          ...userData,
          'createdAt': FieldValue.serverTimestamp(),
        }),
      ).called(1);
    });

    test('should throw FirebaseException when update fails', () async {
      when(
        () => mockFirestore.collection('users'),
      ).thenReturn(mockCollectionReference);
      when(
        () => mockCollectionReference.doc(userId),
      ).thenReturn(mockDocumentReference);
      when(
        () => mockDocumentReference.get(),
      ).thenAnswer((_) async => mockDocumentSnapshot);
      when(() => mockDocumentSnapshot.exists).thenReturn(true);
      when(() => mockDocumentReference.update(any())).thenThrow(
        FirebaseException(
          plugin: 'FirebaseFirestore',
          message: 'Update failed',
        ),
      );

      expect(
        () async => await firestoreService.upsertUser(
          userId: userId,
          userData: userData,
        ),
        throwsA(isA<FirebaseException>()),
      );
    });
    test('should throw FirebaseException when set fails', () async {
      when(
        () => mockFirestore.collection('users'),
      ).thenReturn(mockCollectionReference);
      when(
        () => mockCollectionReference.doc(userId),
      ).thenReturn(mockDocumentReference);
      when(
        () => mockDocumentReference.get(),
      ).thenAnswer((_) async => mockDocumentSnapshot);
      when(() => mockDocumentSnapshot.exists).thenReturn(false);
      when(() => mockDocumentReference.set(any())).thenThrow(
        FirebaseException(plugin: 'FirebaseFirestore', message: 'Set failed'),
      );

      expect(
        () async => await firestoreService.upsertUser(
          userId: userId,
          userData: userData,
        ),
        throwsA(isA<FirebaseException>()),
      );
    });
  });
}
