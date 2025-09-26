import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/common/error/failure_handler.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_detail/domain/repository/i_word_selection_detail_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_detail/infrastructure/datasource/word_selection_detail_remote.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IWordSelectionDetailRepository)
class WordSelectionDetailRepository extends IWordSelectionDetailRepository {
  final WordSelectionDetailRemoteDataSource remoteDataSource;

  WordSelectionDetailRepository({required this.remoteDataSource});

  @override
  Future<Either<AppFailure, WordSelection>> getWordSelectionDetail({
    required String id,
  }) async {
    try {
      final wordSelection = await remoteDataSource.getWordSelectionDetail(
        id: id,
      );
      return Right(wordSelection);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
