import 'package:flutter/material.dart';
import '../../responses/app_responses.dart';
import '../../api_services/app_api_services.dart';

class AlbumDetailsProvider with ChangeNotifier {
  ApiResponse<AlbumResponse> _album;

  ApiResponse<AlbumResponse> get album=> _album;

  fetchAlbumDetails() async {
    _album = ApiResponse.loading('loading... ');
    notifyListeners();
    try {
      AlbumResponse album = await fetchAlbumDetails();
      _album = ApiResponse.completed(album);
      notifyListeners();
    } catch (e) {
      _album = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

}