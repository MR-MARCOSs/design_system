import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/button/button.dart';
import 'package:untitled/DesignSystem/Components/button/button_view_model.dart';
import 'package:untitled/DesignSystem/Components/field/field.dart';
import 'package:untitled/DesignSystem/Components/field/field_view_model.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isTermsChecked = false; // Estado da checkbox

  void onRegisterPressed() {
    // Adicione a lógica de registro aqui
    print('Registrar pressionado');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar')),
      body: SingleChildScrollView( // Permite rolagem se o conteúdo for muito grande
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo do aplicativo
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
              Row(
                children: [
                  Checkbox(
                    value: isTermsChecked,
                    onChanged: (value) {
                      setState(() {
                        isTermsChecked = value ?? false;
                      });
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      // Adicione a ação para abrir os Termos de Serviço
                      print('Termos de Serviço');
                    },
                    child: Text(
                      'Eu li e concordo com os Termos de Serviço',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomButton(
                viewModel: ButtonViewModel(
                  text: 'Signup',
                  isEnabled: true,
                  normalColor: Color(0xFFF8D247),
                  pressedColor: Color(0xFFF8D247),
                  disabledColor: Colors.grey,
                ),
                onPressed: isTermsChecked ? onRegisterPressed : null,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
                Navigator.pop(context); // Volta para a tela de login
              },
              width: 72,
            ),
          ],
        ),
      ),
    );
  }
}