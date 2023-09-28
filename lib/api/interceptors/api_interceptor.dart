import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiInterceptor extends http.BaseClient {
  final http.Client _inner;
  final String baseUrl;
  final String authToken;

  ApiInterceptor(this._inner, {required this.baseUrl, required this.authToken});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // Apply authentication token to headers
    request.headers['Authorization'] = 'Bearer $authToken';

    // Add logging, error handling, or any other intercepting logic here

    // Create a new Request object and set its properties
    final modifiedRequest = http.Request(request.method, Uri.parse('$baseUrl/${request.url}'))
      ..headers.addAll(request.headers)
      ..body = (request is http.Request ? request.body : null)!;

    return _inner.send(modifiedRequest);
  }
}
