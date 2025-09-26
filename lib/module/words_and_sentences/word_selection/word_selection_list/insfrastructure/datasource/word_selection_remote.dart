import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/progress/infrastructure/dto/user_progress_dto.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/insfrastructure/dto/word_selection_dto.dart';
import 'package:vietlite/plugin/firebase/firestore_service.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';

@injectable
class WordSelectionRemoteDataSource {
  final FirestoreService firestoreService;

  const WordSelectionRemoteDataSource({required this.firestoreService});

  Future<List<WordSelection>> getWordSelections({
    ExerciseType? exerciseType,
  }) async {
    final List<Map<String, dynamic>> wordSelectionsMap = await firestoreService
        .getDocumentsInCollection(
          collection: 'wordSelections',
          orderBy: 'order',
        );
    final wordSelections =
        wordSelectionsMap.map((wordSelection) {
          return WordSelectionDto.fromJson(wordSelection).toDomain;
        }).toList();
    return wordSelections;
  }

  Future<List<UserProgress>> getUserProgress({required String userId}) async {
    final List<Map<String, dynamic>> wordSelectionsMap = await firestoreService
        .getDocumentsInCollection(
          collection: 'users/$userId/progress',
          subCollection: 'exercises',
          filterKey: 'exerciseType',
          filterValue: ExerciseType.wordSelection.name,
        );
    final userProgressList =
        wordSelectionsMap.map((userProgress) {
          return UserProgressDto.fromJson(userProgress).toDomain;
        }).toList();
    return userProgressList;
  }
}
