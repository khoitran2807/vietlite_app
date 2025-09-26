import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/infrastructure/dto/word_match_dto.dart';
import 'package:vietlite/plugin/firebase/firestore_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class WordMatchDetailRemoteDataSource {
  final FirestoreService firestoreService;
  const WordMatchDetailRemoteDataSource({required this.firestoreService});
  Future<WordMatch> getWordMatchDetail({required String id}) async {
    final Map<String, dynamic> wordMatchMap = await firestoreService
        .getDocumentInCollection(
          collection: 'wordMatches',
          document: id,
          subCollection: 'exercises',
        );
    return WordMatchDto.fromJson(wordMatchMap).toDomain;
  }
}
