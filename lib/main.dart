import 'package:flutter/material.dart';
import 'package:samiksha/src/common/services/api_service.dart';
import 'package:samiksha/src/common/services/auth_service.dart';
import './screens/signup.dart';
import 'src/common/services/session_manager.dart';
import '/screens/login.dart';

void main() {
  ApiService apiService = ApiService('https://BASE_URL');
  AuthService authService = AuthService(apiService);
  runApp(MyApp(authService: authService));
}

class MyApp extends StatelessWidget {
  final AuthService authService;

  const MyApp({super.key, required this.authService});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)),
          initialRoute: '/login',
          routes: {
            '/login': (context) =>  LoginPage(authService: authService),
            '/signup': (context) =>  SignupPage(authService: authService),
          },
    );
  }
}
