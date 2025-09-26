import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';

abstract class IWordSelectionRepository {
  Future<Either<AppFailure, List<WordSelection>>> getWordSelections();

  Future<Either<AppFailure, List<UserProgress>>> getUserProgress({
    required String userId,
  });
}
