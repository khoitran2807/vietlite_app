import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';

abstract class IWordSelectionDetailRepository {
  Future<Either<AppFailure, WordSelection>> getWordSelectionDetail({
    required String id,
  });
}
