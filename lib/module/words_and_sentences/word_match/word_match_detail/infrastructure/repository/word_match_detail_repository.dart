import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/common/error/failure_handler.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_detail/domain/repository/i_word_match_detail_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_detail/infrastructure/datasource/word_match_detail_remote.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IWordMatchDetailRepository)
class WordMatchDetailRepository extends IWordMatchDetailRepository {
  final WordMatchDetailRemoteDataSource remoteDataSource;

  WordMatchDetailRepository({required this.remoteDataSource});

  @override
  Future<Either<AppFailure, WordMatch>> getWordMatchDetail({
    required String id,
  }) async {
    try {
      final wordMatch = await remoteDataSource.getWordMatchDetail(id: id);
      return Right(wordMatch);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
