import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/discover/things/infrastructure/dto/thing_dto.dart';
import 'package:vietlite/plugin/firebase/firestore_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThingDetailRemoteDataSource {
  final FirestoreService firestoreService;

  const ThingDetailRemoteDataSource({required this.firestoreService});

  Future<Thing> getThingDetail({required String id}) async {
    final Map<String, dynamic> thingMap = await firestoreService
        .getDocumentInCollection(
          collection: 'things',
          document: id,
          subCollection: 'exercises',
        );
    return ThingDto.fromJson(thingMap).toDomain;
  }
}
