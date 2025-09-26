import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/common/error/failure_handler.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/repository/i_word_match_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/infrastructure/datasource/word_match_remote.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IWordMatchRepository)
class WordMatchRepository extends IWordMatchRepository {
  final WordMatchRemoteDataSource remoteDataSource;

  WordMatchRepository({required this.remoteDataSource});

  @override
  Future<Either<AppFailure, List<WordMatch>>> getWordMatches() async {
    try {
      final List<WordMatch> wordMatches =
          await remoteDataSource.getWordMatches();
      return Right(wordMatches);
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
