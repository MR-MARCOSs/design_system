// input_field.dart

import 'package:flutter/material.dart';
import 'input_field_view_model.dart';

/// Widget de caixa de texto personalizado.
class CustomInputField extends StatelessWidget {
  final InputFieldViewModel viewModel; // Dados para configurar a caixa de texto

  // Construtor privado que cria uma instância do [CustomInputField]
  const CustomInputField._(this.viewModel);

  // Método estático para criar uma instância do [CustomInputField]
  static Widget instantiate({required InputFieldViewModel viewModel}) {
    return CustomInputField._(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: viewModel.controller,
        keyboardType: viewModel.keyboardType,
        obscureText: viewModel.obscureText,
        decoration: InputDecoration(
          labelText: viewModel.label,
          hintText: viewModel.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          contentPadding: EdgeInsets.all(12.0),
        ),
      ),
    );
  }
}
