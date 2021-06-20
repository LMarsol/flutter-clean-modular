import 'package:flutter/foundation.dart';

enum HttpMethod { post, get, put, delete }

abstract class HttpClient {
  String get baseUrl;

  Future<dynamic> invoke({
    @required String path,
    @required Map<String, dynamic> body,
    @required Map<String, dynamic> queryParameters,
    @required HttpMethod method,
  });
}
