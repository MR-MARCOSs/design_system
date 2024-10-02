import 'package:flutter/material.dart';

class FieldViewModel {
  String? label;
  String value;
  IconData? icon;
  bool isEnabled;
  bool isError;
  bool isPressed;

  // Remova 'late' e torne os parâmetros opcionais
  Function(String)? onChanged;
  Function()? onPressed;

  FieldViewModel({
    this.label,
    this.value = '',
    this.icon,
    this.isEnabled = true,
    this.isError = false,
    this.isPressed = false,
    this.onChanged, // Agora é opcional
    this.onPressed, // Agora é opcional
  });
}
