import '../../responses/app_responses.dart';
import '../api_modules/api_module_dio/api_module_dio.dart';
import '../../constants/app_constants.dart';

Future<List<AlbumResponse>> fetchAlbums() async{
  return ApiBaseHelper().onRequest(
    path: getAlbums,
    method: ApiMethod.GET,
    requiredToken: false,
    onSuccess: (response){
      return List<AlbumResponse>.from(response.data.map((model) => AlbumResponse.fromJson(model)));
    },
  );
}