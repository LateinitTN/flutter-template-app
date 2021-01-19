import 'dart:convert';
import 'package:dio/dio.dart';
import '../../flavors.dart';


final BaseOptions options = BaseOptions(
  baseUrl: F.baseUrl,
  connectTimeout: 25000,
  receiveTimeout: 25000,
);

final defaultDioClient = Dio()
  ..options = options
  ..interceptors.add(defaultInterceptor);
  // ..interceptors.add(
  //   DioCacheManager(CacheConfig(baseUrl: F.baseUrl)).interceptor,
  // );

final JsonDecoder decoder = JsonDecoder();
final JsonEncoder encoder = JsonEncoder.withIndent('  ');

final InterceptorsWrapper defaultInterceptor = InterceptorsWrapper(
  onRequest: (RequestOptions options) async {
    // httpLog("${options.method}: ${options.path},"
    //     "query: ${options.queryParameters},"
    //     "data: ${options.data}");
    return options;
  },
  onResponse: (Response response) async {
    return response; // continue
  },
  onError: (DioError error) async {
    return error; //continue
  },
);
