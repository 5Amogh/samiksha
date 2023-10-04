import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final  String baseUrl;
  final String? accessToken;
  // final Object? headers;

  ApiService( this.baseUrl, {this.accessToken});

  Future<Map<String, dynamic>> _handleResponse(http.Response response) async {
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseData;
    } else {
      throw Exception(responseData['message'] ?? 'Something went wrong');
    }
  }

  Future<Map<String, dynamic>> get(String endpoint, [Map<String, String>? headers]) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'),
        headers: _createHeaders(headers));

    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> post(String endpoint, dynamic data, [Map<String, String>? headers]) async {
    final response = await http.post(Uri.parse('$baseUrl/$endpoint'),
        headers: _createHeaders(headers), body: json.encode(data));

    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> patch(String endpoint, dynamic data, [Map<String, String>? headers]) async {
    final response = await http.patch(Uri.parse('$baseUrl/$endpoint'),
        headers: _createHeaders(headers), body: json.encode(data));

    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> delete(String endpoint, [Map<String, String>? headers]) async {
    final response = await http.delete(Uri.parse('$baseUrl/$endpoint'),
        headers: _createHeaders(headers));

    return _handleResponse(response);
  }

  Map<String, String> _createHeaders([Map<String, String>? customHeaders = const {}]) {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if( customHeaders != null){
      headers.addAll(customHeaders);
    }

    if (accessToken != null) {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    return headers;
  }
}
