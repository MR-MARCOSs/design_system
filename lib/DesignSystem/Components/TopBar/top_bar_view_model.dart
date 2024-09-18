import 'package:flutter/material.dart';

enum TopBarStyle {
  light,
  dark,
}

class TopBarViewModel {
  final String title;
  final List<Widget>? actions;
  final TopBarStyle style;
  final Color? backgroundColor;
  final Color? titleColor;

  TopBarViewModel({
    required this.title,
    this.actions,
    this.style = TopBarStyle.light,
    this.backgroundColor,
    this.titleColor,
  });
}
