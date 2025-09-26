import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';

abstract class IWordMatchRepository {
  Future<Either<AppFailure, List<WordMatch>>> getWordMatches();

  Future<Either<AppFailure, List<UserProgress>>> getUserProgress({
    required String userId,
  });
}
