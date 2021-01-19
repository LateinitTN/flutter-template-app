import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dio_interceptors.dart';
import 'dio_exception.dart';

class ApiBaseHelper{
  Dio dio;
  ApiBaseHelper() {
    this.dio = defaultDioClient;
  }

  // ignore: missing_return
  Future<T> onRequest<T>({
    @required String path,
    @required String method,
    @required T Function(Response) onSuccess,
    Map<String, dynamic> query = const {},
    Map<String, dynamic> headers = const {},
    dynamic data = const {},
    bool requiredToken = true,
    bool ignoreResponse = false,
  }) async {
    Response response;
    try {
      final httpOption = Options(method: method);
      if (requiredToken) {
        httpOption.headers['Authorization'] = "bearer TOKEN";
      }
      httpOption.headers.addAll(headers);
      response = await dio.request(
        path,
        options: httpOption,
        queryParameters: query,
        data: data,
      );
      return onSuccess(_returnResponse(response));
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
        refreshToken();
        break;
      case 402:
        backToMain();
        break;
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 404:
        throw FetchDataException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future refreshToken() async {}

  Future backToMain() async {}
}