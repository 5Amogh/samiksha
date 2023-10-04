import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
        body: Container(
          color: Colors.white,
          child: const SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                RegistrationForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});


  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final apiService = ApiService('https://elevate-apis.shikshalokam.org/');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const FormFieldCard(
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person),
              ),
              const SizedBox(height: 20.0),
              const FormFieldCard(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              const SizedBox(height: 20.0),
              const FormFieldCard(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              const SizedBox(height: 20.0),
              const FormFieldCard(
                labelText: 'Confirm Password',
                prefixIcon: Icon(Icons.lock),
              ),
              const SizedBox(height: 40.0),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () async{
                    // if (_formKey.currentState!.validate()) {
                      // Perform registration logic here
                      // You can access the form field values using:
                      // _fullNameController.text
                      // _emailController.text
                      // _passwordController.text
                      // _confirmPasswordController.text
                    // }
                    try {
                      // final response = await  apiService.post('user/v1/account/login', {
                      //   "email": "user@email.com",
                      //   "password": "user@password"
                      // });
                      // print('GET Response: $response');

                     // await SessionManager.saveAccessToken({'name': 'kiran'});
                      final tokens = await SessionManager.getAccessToken();
                      print(tokens);


                      // Make other API calls as needed (post, patch, delete)
                    } catch (e) {
                      print('Error: $e');
                    }
                    // apiService.post('user/v1/account/login', {
                    //   "email": "Prod02@yopmail.com",
                    //   "password": "Okok@123"
                    // });
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(40, 40))),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'SIGN UP',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 200.0, bottom: 20.0),
                child: RichText(
                    text: TextSpan(
                        text: 'Already have an account? ',
                        style: const TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                        text: 'Sign in',
                        style: const TextStyle(color: Colors.orange),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            if (kDebugMode) {
                              print('Sign in clicked');
                            }
                          },
                      )
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FormFieldCard extends StatefulWidget {
  final String labelText;
  final Icon prefixIcon;

  const FormFieldCard(
      {Key? key, required this.labelText, required this.prefixIcon})
      : super(key: key);

  @override
  _FormFieldCardState createState() => _FormFieldCardState();
}

class _FormFieldCardState extends State<FormFieldCard> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          isFocused = hasFocus;
        });
      },
      child: Card(
        elevation: isFocused ? 8.0 : 0.0,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: widget.labelText,
            prefixIcon: widget.prefixIcon,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
