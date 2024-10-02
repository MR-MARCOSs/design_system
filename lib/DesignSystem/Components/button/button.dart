import 'package:flutter/material.dart';
import 'button_view_model.dart';

class CustomButton extends StatelessWidget {
  final ButtonViewModel viewModel;
  final void Function()? onPressed;

  const CustomButton({
    Key? key,
    required this.viewModel,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: viewModel.isEnabled ? onPressed : null,
      child: Container(
        width: 343,
        height: 48,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: viewModel.isEnabled
              ? viewModel.normalColor
              : viewModel.disabledColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            viewModel.text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
