import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/insfrastructure/dto/word_selection_dto.dart';
import 'package:vietlite/plugin/firebase/firestore_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class WordSelectionDetailRemoteDataSource {
  final FirestoreService firestoreService;
  const WordSelectionDetailRemoteDataSource({required this.firestoreService});
  Future<WordSelection> getWordSelectionDetail({required String id}) async {
    final Map<String, dynamic> wordSelectionMap = await firestoreService
        .getDocumentInCollection(
          collection: 'wordSelections',
          document: id,
          subCollection: 'exercises',
        );
    return WordSelectionDto.fromJson(wordSelectionMap).toDomain;
  }
}
