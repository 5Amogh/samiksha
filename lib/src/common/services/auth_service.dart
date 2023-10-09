import 'package:samiksha/src/common/constants/api_endpoints.dart';
import 'package:samiksha/src/common/services/api_service.dart';
import 'dart:developer';

import 'package:samiksha/src/common/services/session_manager.dart';


class AuthService {
  final ApiService apiService;

  AuthService(this.apiService);

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await apiService.post(ApiEndpoints.login, {
        'email': email,
        'password': password,
      });
      await SessionManager.saveAccessToken(response['result']['access_token']);
      await SessionManager.saveRefreshToken(response['result']['refresh_token']);
      return response;
    } catch (error) {
      // Handle errors or throw them back to the caller
      throw Exception('Login failed: $error');
    }
  }

  Future<Map<String, dynamic>> register(String email, String password) async {
    try {
      final response = await apiService.post(ApiEndpoints.signup, {
        'email': email,
        'password': password,
      });
      // Handle the registration response here, if needed
      return response;
    } catch (error) {
      // Handle errors or throw them back to the caller
      throw Exception('Registration failed: $error');
    }
  }
}
