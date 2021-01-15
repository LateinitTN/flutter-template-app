import '../../responses/app_responses.dart';
import '../app_api_services.dart';

Future<AlbumResponse> fetchAlbumDetails() async {
  final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.fetch_album));
  return AlbumResponse.fromJson(response);
}