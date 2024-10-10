import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/button/button.dart';
import 'package:untitled/DesignSystem/Components/button/button_view_model.dart';
import 'package:untitled/DesignSystem/Components/field/field.dart';
import 'package:untitled/DesignSystem/Components/field/field_view_model.dart';
import 'package:untitled/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void onLoginPressed() {
    print('Login pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Center(
                      child: Image.asset(
                        'assets/logo.png', // Substitua pelo caminho da sua imagem
                        height: 100,
                      ),
                    ),
                  ),
                  CustomInputField(
                    viewModel: FieldViewModel(
                      label: 'E-mail',
                      value: emailController.text,
                      onChanged: (newValue) {
                        setState(() {
                          emailController.text = newValue;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomInputField(
                    viewModel: FieldViewModel(
                      label: 'Password',
                      value: passwordController.text,
                      icon: isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onChanged: (newValue) {
                        setState(() {
                          passwordController.text = newValue;
                        });
                      },
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        print('Esqueceu a senha?');
                      },
                      child: Text(
                        'Esqueceu a senha?',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                    viewModel: ButtonViewModel(
                      text: 'Login',
                      isEnabled: true,
                      normalColor: Color(0xFFF8D247),
                      pressedColor: Color(0xFFF8D247),
                      disabledColor: Colors.grey,
                    ),
                    onPressed: onLoginPressed,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Don’t  Have An Account?"),
                SizedBox(height: 10),
                CustomButton(
                  viewModel: ButtonViewModel(
                    text: 'Sign Up',
                    isEnabled: true,
                    normalColor: Color(0xFFF8D247),
                    pressedColor: Color(0xFFF8D247),
                    disabledColor: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen()),
                    );
                  },
                  width: 72,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}