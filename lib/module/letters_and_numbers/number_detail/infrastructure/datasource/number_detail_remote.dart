import 'package:vietlite/plugin/firebase/firestore_service.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';

import 'package:vietlite/module/letters_and_numbers/numbers/infrastructure/dto/number_dto.dart';

@injectable
class NumberDetailRemoteDataSource {
  final FirestoreService firestoreService;

  const NumberDetailRemoteDataSource({required this.firestoreService});

  Future<Number> getNumberDetail({required String id}) async {
    final Map<String, dynamic> numberMap = await firestoreService
        .getDocumentInCollection(collection: 'numbers', document: id);
    return NumberDto.fromJson(numberMap).toDomain;
  }
}
