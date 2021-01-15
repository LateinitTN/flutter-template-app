import 'package:flutter/material.dart';
import '../../responses/app_responses.dart';
import '../../api_services/app_api_services.dart';

class AlbumProvider with ChangeNotifier {
  ApiResponse<List<AlbumResponse>> _listAlbums;
  ApiResponse<List<AlbumResponse>> get listAlbums=> _listAlbums;

  getAlbumsList() async {
    _listAlbums = ApiResponse.loading('loading... ');
    notifyListeners();
    try {
      List<AlbumResponse> _list = await fetchAlbums();
      _listAlbums = ApiResponse.completed(_list);
      notifyListeners();
    } catch (e) {
      _listAlbums = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}