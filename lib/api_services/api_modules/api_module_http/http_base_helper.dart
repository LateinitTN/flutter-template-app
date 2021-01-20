import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../flavors.dart';
import 'api_exceptions.dart';

class ApiBaseHelper {
  static final ApiBaseHelper _singleton = ApiBaseHelper();
  static ApiBaseHelper get instance => _singleton;

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
    if (response.statusCode == 200)
    {
      return response;
    }
    else if (response.statusCode == 401)
    {
      refreshToken();
    }
    else if (response.statusCode == 402)
    {
      backToMain();
    }
    else if (response.statusCode == 404){
      throw FetchDataException('${response.statusCode} The server can not find the requested resource.');
    }
    else if (response.statusCode == 403)
    {
      throw FetchDataException('${response.statusCode} The client does not have access rights to the content.');
    }
    else if (response.statusCode == 500)
    {
      throw FetchDataException('${response.statusCode} The server has encountered a situation it doesn\'t know how to handle.');
    }
    else if (response.statusCode == 503)
    {
      throw FetchDataException('${response.statusCode} The server is not ready to handle the request.');
    }
  }

  Future refreshToken() async {}

  Future backToMain() async {}
}
