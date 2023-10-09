import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:samiksha/src/common/services/auth_service.dart';
import '../src/common/widgets/forms/text_input_card.dart';
import 'package:samiksha/src/common/services/api_service.dart';

class SignupPage extends StatefulWidget {
  final AuthService authService;

  const SignupPage({super.key, required this.authService});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextInputCard(
              labelText: 'Full Name',
              prefixIcon: const Icon(Icons.person),
              controller: _fullNameController,
            ),
            const SizedBox(height: 20.0),
            TextInputCard(
              labelText: 'Email',
              prefixIcon: const Icon(Icons.email),
              controller: _emailController,
            ),
            const SizedBox(height: 20.0),
            TextInputCard(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock),
              controller: _passwordController,
            ),
            const SizedBox(height: 20.0),
            TextInputCard(
              labelText: 'Confirm Password',
              prefixIcon: const Icon(Icons.lock),
              controller: _confirmPasswordController,
            ),
            const SizedBox(height: 40.0),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform registration logic here
                    // You can access the form field values using:
                    print(_fullNameController.text);
                    print(_emailController.text);
                    print(_passwordController.text);
                    print(_confirmPasswordController.text);
                  }
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
                          Navigator.pushNamed(context, '/login');
                        },
                    )
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
