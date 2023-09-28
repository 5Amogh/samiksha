import 'dart:convert';
import 'package:http/http.dart' as http;
import '../interceptors/api_interceptor.dart';

class ApiService {
  final http.Client _client;

  ApiService({required String baseUrl, required String authToken})
      : _client = ApiInterceptor(
    http.Client(),
    baseUrl: baseUrl,
    authToken: authToken,
  );

  Future<dynamic> get(String endpoint) async {
    final response = await _client.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> post(String endpoint, dynamic body) async {
    final response = await _client.post(
      Uri.parse(endpoint),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create resource');
    }
  }

  Future<dynamic> put(String endpoint, dynamic body) async {
    final response = await _client.put(
      Uri.parse(endpoint),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update resource');
    }
  }

  Future<dynamic> patch(String endpoint, dynamic body) async {
    final response = await _client.patch(
      Uri.parse(endpoint),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update resource partially');
    }
  }

  Future<void> delete(String endpoint) async {
    final response = await _client.delete(Uri.parse(endpoint));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete resource');
    }
  }
}
