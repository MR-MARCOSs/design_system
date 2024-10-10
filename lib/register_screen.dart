import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/button/button.dart';
import 'package:untitled/DesignSystem/Components/button/button_view_model.dart';
import 'package:untitled/DesignSystem/Components/field/field.dart';
import 'package:untitled/DesignSystem/Components/field/field_view_model.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isTermsAgreed = false; // Estado da checkbox

  void onSignUpPressed() {
    // Adicione a lógica de registro aqui
    print('Sign Up pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
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
                         'assets/logo.png',
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
                  SizedBox(height: 20),
                  // Checkbox com texto e link
                  
                  Wrap( // Use o Wrap aqui
                    children: [
                      Checkbox(
                        value: isTermsAgreed,
                        onChanged: (value) {
                          setState(() {
                            isTermsAgreed = value!;
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          // Ação ao clicar em "Terms & Services"
                          print('Terms & Services clicado');
                        },
                        child: Text(
                          'I have read and agree Terms & Services',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Ação ao clicar em "Terms & Services"
                          print('Terms & Services clicado');
                        },
                        child: Text(
                          ' Terms & Services',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    viewModel: ButtonViewModel(
                      text: 'Signup',
                      isEnabled: true,
                      normalColor: Color(0xFFF8D247),
                      pressedColor: Color(0xFFF8D247),
                      disabledColor: Colors.grey,
                    ),
                    onPressed: onSignUpPressed,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // Rodapé com botão "Login"
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            color: Colors.transparent,
            child: Column(
              children: [
                Text("Already Have An Account?"),
                SizedBox(height: 10),
                CustomButton(
                  viewModel: ButtonViewModel(
                    text: 'Login',
                    isEnabled: true,
                    normalColor: Color(0xFFF8D247),
                    pressedColor: Color(0xFFF8D247),
                    disabledColor: Colors.grey,
                  ),
                  onPressed: () {
                    // Ação ao clicar em "Login" no rodapé
                    Navigator.pop(context); // Volta para a tela de login
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