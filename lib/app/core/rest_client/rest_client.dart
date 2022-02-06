import 'package:get/get_connect.dart';

class RestClass extends GetConnect {
  final _backendBaseUrl = 'http://dartweek.academiadoflutter.com.br';

  RestClass() {
    httpClient.baseUrl = _backendBaseUrl;
  }
}

class RestClientException implements Exception {
  final int? code;
  final String message;
  RestClientException(
    this.message, {
    this.code,
  });

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
