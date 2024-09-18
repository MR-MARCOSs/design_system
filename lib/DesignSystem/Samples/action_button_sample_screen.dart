
import 'package:flutter/material.dart';
import '../Components/input/input_field.dart'; // Certifique-se de importar o arquivo correto
import '../Components/input/input_field_view_model.dart'; // Certifique-se de importar o arquivo correto

class InputFieldSampleScreen extends StatelessWidget {
  const InputFieldSampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controladores de texto para as caixas de entrada
    final TextEditingController controller1 = TextEditingController();
    final TextEditingController controller2 = TextEditingController();
    final TextEditingController controller3 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Input Field Samples'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0), 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Grupo de caixas de texto com rótulos e dicas
              CustomInputField.instantiate(
                viewModel: InputFieldViewModel(
                  label: 'Name',
                  hint: 'Enter your name',
                  controller: controller1,
                ),
              ),
              SizedBox(height: 16),
              CustomInputField.instantiate(
                viewModel: InputFieldViewModel(
                  label: 'Email',
                  hint: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  controller: controller2,
                ),
              ),
              SizedBox(height: 16),
              CustomInputField.instantiate(
                viewModel: InputFieldViewModel(
                  label: 'Password',
                  hint: 'Enter your password',
                  obscureText: true,
                  controller: controller3,
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
