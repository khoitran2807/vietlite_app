import 'package:vietlite/module/letters_and_numbers/numbers/infrastructure/dto/number_dto.dart';
import 'package:vietlite/plugin/firebase/firestore_service.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';

@injectable
class NumberRemoteDataSource {
  final FirestoreService firestoreService;

  const NumberRemoteDataSource({required this.firestoreService});

  Future<List<Number>> getNumbers() async {
    final List<Map<String, dynamic>> numbersMap = await firestoreService
        .getDocumentsInCollection(collection: 'numbers', orderBy: 'title');
    return numbersMap
        .map((number) => NumberDto.fromJson(number).toDomain)
        .toList();
  }
}
