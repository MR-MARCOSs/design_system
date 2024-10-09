import 'package:flutter/material.dart';
import 'button_view_model.dart';

class CustomButton extends StatelessWidget {
  final ButtonViewModel viewModel;
  final void Function()? onPressed;
  final double? width; // Nova propriedade para largura

  const CustomButton({
    Key? key,
    required this.viewModel,
    this.onPressed,
    this.width, // Tornando a largura opcional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: viewModel.isEnabled ? onPressed : null,
      child: Container(
        width: width ?? 343, // Se width não for definido, usa 343
        height: 48,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: viewModel.isEnabled
              ? viewModel.normalColor
              : viewModel.disabledColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: FittedBox( // Adiciona o FittedBox aqui
            fit: BoxFit.scaleDown, // Ajusta o texto para caber na largura
            child: Text(
              viewModel.text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}