import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './screens/signup.dart';
import 'src/common/services/api_service.dart';
import 'src/common/services/session_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey[850],
            ),
            onPressed: () {
              if (kDebugMode) {
                print('Go back bruhh');
              }
            },
          ),
        ),
        body: const SingleChildScrollView(
          child: SignupPage(),
        ),
      ),
    );
  }
}
