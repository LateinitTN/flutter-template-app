import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../../flavors.dart';
import 'api_exceptions.dart';
import '../../constants/app_constants.dart';

class HttpClient {
  static final HttpClient _singleton = HttpClient();

  static HttpClient get instance => _singleton;

  Future<dynamic> fetchData(String url, {Map<String, String> params}) async {
    var responseJson;

    var uri = F.baseUrl + url + ((params != null) ? this.queryParameters(params) : "");
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final response = await http.get(uri, headers: header);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  String queryParameters(Map<String, String> params) {
    if (params != null) {
      final jsonString = Uri(queryParameters: params);
      return '?${jsonString.query}';
    }
    return '';
  }

  Future<dynamic> postData(String url, dynamic body) async {
    var responseJson;
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final response =
          await http.post(F.baseUrl + url, body: body, headers: header);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        refreshToken();
        break;
      case 402:
        backToMain();
        break;
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future refreshToken() async {}

  Future backToMain() async {}
}
