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
    return Column(
      children: [
        Expanded( // Permite que o conteúdo da coluna ocupe o espaço disponível
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
                      'assets/logo.png', // Substitua 'assets/logo.png' pelo caminho da sua imagem
                      height: 100, // Ajuste a altura conforme necessário
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
                      // Adicione a ação desejada ao clicar no texto
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
                    normalColor: Color(0xFFF8D247), // Cor #F8D247
                    pressedColor: Color(0xFFF8D247), // Cor #F8D247 (pressionado)
                    disabledColor: Colors.grey,
                  ),
                  onPressed: onLoginPressed,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
        // Rodapé com botão "Sign Up"
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          color: Colors.transparent, // Cor de fundo transparente para o rodapé
          child: Column(
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
                  // Navega para a tela de registro ao clicar em "Sign Up"
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                width: 72,
              ),
            ],
          ),
        ),
      ],
    );
  }
}