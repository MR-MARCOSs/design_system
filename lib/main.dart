import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/button/button.dart';
import 'package:untitled/DesignSystem/Components/button/button_view_model.dart';
import 'package:untitled/DesignSystem/Components/field/field.dart';
import 'package:untitled/DesignSystem/Components/field/field_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      home: Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: LoginScreen(),
      ),
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
    // Adicione a lógica de login aqui
    print('Login pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomInputField(
            viewModel: FieldViewModel(
              label: 'E-mail',
              value: emailController.text,
              // Passa uma função para onChanged
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
              icon: isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              // Passa uma função para onChanged
              onChanged: (newValue) {
                setState(() {
                  passwordController.text = newValue;
                });
              },
              // Passa uma função para onPressed
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
          ),
          SizedBox(height: 20),
          CustomButton(
            viewModel: ButtonViewModel(
              text: 'Login',
              isEnabled: true,
              normalColor: Colors.yellow,
              pressedColor: Colors.amberAccent,
              disabledColor: Colors.grey,
            ),
            onPressed: onLoginPressed,
          ),
        ],
      ),
    );
  }
}
