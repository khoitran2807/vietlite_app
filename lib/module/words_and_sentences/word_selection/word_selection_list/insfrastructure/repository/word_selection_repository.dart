import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/common/error/failure_handler.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/repository/i_word_selection_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/insfrastructure/datasource/word_selection_remote.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IWordSelectionRepository)
class WordSelectionRepository extends IWordSelectionRepository {
  final WordSelectionRemoteDataSource remoteDataSource;

  WordSelectionRepository({required this.remoteDataSource});

  @override
  Future<Either<AppFailure, List<WordSelection>>> getWordSelections() async {
    try {
      final List<WordSelection> wordSelections =
          await remoteDataSource.getWordSelections();
      return Right(wordSelections);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, List<UserProgress>>> getUserProgress({
    required String userId,
  }) async {
    try {
      final List<UserProgress> wordUserProgress = await remoteDataSource
          .getUserProgress(userId: userId);
      return Right(wordUserProgress);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
