import 'package:dio/dio.dart';

class InternalError implements Exception {
  final String message;

  InternalError(this.message);
}

class CommonError implements Exception {
  final String message;

  CommonError(this.message);
}

class WebClient {
  Dio? _dio;

  WebClient() {
    _dio = _createHttpClient();
  }

  Dio _createHttpClient() {
    var dio = Dio()
      ..options.baseUrl = 'https://api.tvmaze.com'
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    return dio;
  }

  Dio get dio => _dio!;

  Future<Response<dynamic>>? get(String uri, [Options? options]) {
    return _dio?.get(uri, options: options);
  }

  Future<Response<dynamic>>? post(String uri, dynamic data) {
    return _dio?.post(uri, data: data);
  }

  Future<Response<dynamic>>? put(String uri, dynamic data) {
    return _dio?.put(uri, data: data);
  }

  Future<Response<dynamic>>? delete(String uri) {
    return _dio?.delete(uri);
  }
}
