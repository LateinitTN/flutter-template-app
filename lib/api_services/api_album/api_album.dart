import '../../responses/app_responses.dart';
import '../app_api_services.dart';
import '../../constants/app_constants.dart';

Future<List<AlbumResponse>> fetchAlbums() async {
  final response = await HttpClient.instance.fetchData(getAlbums);
  return List<AlbumResponse>.from(response.map((model) => AlbumResponse.fromJson(model)));
}