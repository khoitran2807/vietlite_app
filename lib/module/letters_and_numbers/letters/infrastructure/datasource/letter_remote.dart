import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:vietlite/module/letters_and_numbers/letters/infrastructure/dto/letter_dto.dart';
import 'package:vietlite/plugin/firebase/firestore_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class LetterRemoteDataSource {
  final FirestoreService firestoreService;

  const LetterRemoteDataSource({required this.firestoreService});

  Future<List<Letter>> getLetters() async {
    final List<Map<String, dynamic>> lettersMap = await firestoreService
        .getDocumentsInCollection(collection: 'letters', orderBy: 'order');
    return lettersMap
        .map((letter) => LetterDto.fromJson(letter).toDomain)
        .toList();
  }
}
