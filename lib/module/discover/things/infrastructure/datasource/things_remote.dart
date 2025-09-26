import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/discover/things/infrastructure/dto/thing_dto.dart';
import 'package:vietlite/plugin/firebase/firestore_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThingsRemoteDataSource {
  final FirestoreService firestoreService;

  const ThingsRemoteDataSource({required this.firestoreService});

  Future<List<Thing>> getThings(ThingType type) async {
    final List<Map<String, dynamic>> thingsMap = await firestoreService
        .getDocumentsInCollection(
          collection: 'things',
          filterKey: 'type',
          filterValue: type.name,
          orderBy: "order",
        );

    return thingsMap.map((thing) => ThingDto.fromJson(thing).toDomain).toList();
  }
}
