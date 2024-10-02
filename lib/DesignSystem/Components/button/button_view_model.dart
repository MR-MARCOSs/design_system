import 'package:flutter/material.dart';

class ButtonViewModel {
  final String text;
  final IconData? icon;
  final bool isEnabled;
  final Color normalColor;
  final Color pressedColor;
  final Color disabledColor;

  ButtonViewModel({
    required this.text,
    this.icon,
    this.isEnabled = true,
    this.normalColor = Colors.blue,
    this.pressedColor = Colors.blueAccent,
    this.disabledColor = Colors.grey,
  });
}
