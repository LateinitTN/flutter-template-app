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
    } catch (exception) {
      _handleError(exception);
      return null;
    }
  }

  dynamic _returnResponse(Response response) {
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

  dynamic _handleError(dynamic error) {
    if (error is DioError) {
      DioError dioError = error;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          throw FetchDataException("Request to API server was cancelled.");
        case DioErrorType.CONNECT_TIMEOUT:
          throw FetchDataException("Connection timeout with API server.");
        case DioErrorType.DEFAULT:
          throw FetchDataException("Connection to API server failed due to internet connection.");
        case DioErrorType.RECEIVE_TIMEOUT:
          throw FetchDataException("Receive timeout in connection with API server.");
        case DioErrorType.RESPONSE:
          _returnResponse(dioError.response);
          break;
        case DioErrorType.SEND_TIMEOUT:
          throw FetchDataException("Send timeout in connection with API server.");
      }
    } else {
      throw FetchDataException("Unexpected error occured.");
    }
  }
}