import 'package:flutter/material.dart';
import 'field_view_model.dart';

class CustomInputField extends StatelessWidget {
  final FieldViewModel viewModel;

  const CustomInputField({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: viewModel.isEnabled ? Colors.white : Colors.grey.shade300,
        border: Border.all(
          color: viewModel.isError ? Colors.red : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              enabled: viewModel.isEnabled,
              decoration: InputDecoration(
                labelText: viewModel.label,
                border: InputBorder.none,
                errorText: viewModel.isError ? "Valor deve ser ≥ 500" : null,
              ),
              obscureText:
                  viewModel.label == 'Password' && !viewModel.isPressed,
              controller: TextEditingController(text: viewModel.value),
              onChanged: viewModel.onChanged, // Corrigido
            ),
          ),
          if (viewModel.icon != null)
            GestureDetector(
              onTap: () {
                // Chama o callback onPressed do viewModel
                if (viewModel.onPressed != null) {
                  viewModel.onPressed!();
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(viewModel.icon),
              ),
            ),
        ],
      ),
    );
  }
}
