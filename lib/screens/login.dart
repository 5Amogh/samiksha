import 'package:flutter/material.dart';
import 'package:samiksha/src/common/services/auth_service.dart';
import '../src/common/widgets/buttons/primary_button.dart';
import '../src/common/widgets/forms/text_input_card.dart';

class LoginPage extends StatefulWidget {

  final AuthService authService;

   const LoginPage({Key? key, required this.authService}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10.0),
                   const  Text(
                      'Please sign in to continue.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    ),
                    LoginForm(authService: widget.authService),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account? ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () => {
                      debugPrint('Signup click'),
                      Navigator.pushNamed(context, '/signup'),
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.yellow[700],
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final AuthService authService; // Define the authService parameter

   LoginForm({Key? key, required this.authService}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  login() async {
    debugPrint('Redirect to homepage');
    try {
      Map<String, dynamic> response = await widget.authService.login(_emailController.text, _passwordController.text);
      print(response);
    } catch (error) {
      print (error);
    }

  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryButton(
                    label: 'LOGIN',
                    icon: Icons.arrow_forward,
                    buttonAction: login,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
