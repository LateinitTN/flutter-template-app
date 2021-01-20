import '../../responses/app_responses.dart';
import '../../constants/app_constants.dart';
import '../api_modules/api_module_http/api_modules.dart';

Future<List<AlbumResponse>> fetchAlbums() async {
  final response = await ApiBaseHelper.instance.fetchData(getAlbums);
  return List<AlbumResponse>.from(response.map((model) => AlbumResponse.fromJson(model)));
}