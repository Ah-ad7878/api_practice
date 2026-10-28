import 'package:api_practice/album_class.dart';
import 'package:api_practice/api_services_class.dart';

class AlbumApiService extends ApiServicesClass {
  @override
  String get apiUrl => 'albums';

  Future<List<AlbumClass>> getAlbums() async {
    final List rawList = await fetch();
    return rawList
        .map((w) => AlbumClass.fromMap(w as Map<String, dynamic>))
        .toList();
  }
}
