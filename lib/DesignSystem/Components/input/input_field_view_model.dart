// input_field_view_model.dart

import 'package:flutter/material.dart';

/// Modelo de dados para uma caixa de texto.
class InputFieldViewModel {
  final String label;               // Texto do rótulo da caixa de texto
  final String hint;                // Texto de dica dentro da caixa de texto
  final TextInputType keyboardType; // Tipo de teclado a ser exibido
  final bool obscureText;           // Se o texto deve ser oculto (útil para senhas)
  final TextEditingController controller; // Controlador para gerenciar o texto

  /// Construtor do [InputFieldViewModel].
  InputFieldViewModel({
    required this.label,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.controller,
  });
}
