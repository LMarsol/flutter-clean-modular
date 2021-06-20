import 'package:dio/dio.dart';
import 'package:flutter_clean_modular/app/core/config/app_config.dart';
import 'package:flutter_clean_modular/app/core/network/client/http_client.dart';

class HttpClientImpl extends HttpClient {
  Dio _client;

  HttpClientImpl() {
    _client = Dio();
  }

  @override
  Future invoke({
    String path,
    Map<String, dynamic> body,
    Map<String, dynamic> queryParameters,
    HttpMethod method,
  }) {
    // TODO: implement invoke
    throw UnimplementedError();
  }

  @override
  String get baseUrl => AppConfig.apiUrl;
}
