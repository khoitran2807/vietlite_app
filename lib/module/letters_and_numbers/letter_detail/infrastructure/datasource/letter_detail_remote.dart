import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:vietlite/module/letters_and_numbers/letters/infrastructure/dto/letter_dto.dart';
import 'package:vietlite/plugin/firebase/firestore_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class LetterDetailRemoteDataSource {
  final FirestoreService firestoreService;

  const LetterDetailRemoteDataSource({required this.firestoreService});

  Future<Letter> getLetterDetail({required String id}) async {
    final Map<String, dynamic> letterMap = await firestoreService
        .getDocumentInCollection(collection: 'letters', document: id);
    return LetterDto.fromJson(letterMap).toDomain;
  }
}
