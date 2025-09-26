import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/discover/things/infrastructure/dto/thing_dto.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/progress/infrastructure/dto/user_progress_dto.dart';
import 'package:vietlite/plugin/firebase/firestore_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class DiscoverRemoteDataSource {
  final FirestoreService firestoreService;

  const DiscoverRemoteDataSource({required this.firestoreService});

  Future<List<Thing>> getThings() async {
    final List<Map<String, dynamic>> thingsMap = await firestoreService
        .getDocumentsInCollection(collection: 'things', orderBy: 'order');
    return thingsMap.map((thing) => ThingDto.fromJson(thing).toDomain).toList();
  }

  Future<List<UserProgress>> getUserProgress({required String userId}) async {
    final List<Map<String, dynamic>> progressMap = await firestoreService
        .getDocumentsInCollection(
          collection: 'users/$userId/progress',
          filterKey: 'exerciseType',
          filterValue: ExerciseType.things.name,
          orderBy: 'writeAt',
          descending: true,
        );
    final userProgressList =
        progressMap.map((userProgress) {
          return UserProgressDto.fromJson(userProgress).toDomain;
        }).toList();
    return userProgressList;
  }
}
