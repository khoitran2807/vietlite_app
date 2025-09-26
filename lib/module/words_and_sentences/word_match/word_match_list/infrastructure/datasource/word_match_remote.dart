import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/progress/infrastructure/dto/user_progress_dto.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/infrastructure/dto/word_match_dto.dart';
import 'package:vietlite/plugin/firebase/firestore_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class WordMatchRemoteDataSource {
  final FirestoreService firestoreService;

  const WordMatchRemoteDataSource({required this.firestoreService});

  Future<List<WordMatch>> getWordMatches({ExerciseType? exerciseType}) async {
    final List<Map<String, dynamic>> wordMatchesMap = await firestoreService
        .getDocumentsInCollection(collection: 'wordMatches', orderBy: 'order');
    final wordMatches =
        wordMatchesMap.map((wordMatch) {
          return WordMatchDto.fromJson(wordMatch).toDomain;
        }).toList();
    return wordMatches;
  }

  Future<List<UserProgress>> getUserProgress({required String userId}) async {
    final List<Map<String, dynamic>> wordMatchesMap = await firestoreService
        .getDocumentsInCollection(
          collection: 'users/$userId/progress',
          subCollection: 'exercises',
          filterKey: 'exerciseType',
          filterValue: ExerciseType.wordMatch.name,
        );
    final userProgressList =
        wordMatchesMap.map((userProgress) {
          return UserProgressDto.fromJson(userProgress).toDomain;
        }).toList();
    return userProgressList;
  }
}
