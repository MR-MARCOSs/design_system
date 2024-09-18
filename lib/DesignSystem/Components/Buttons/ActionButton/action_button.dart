import 'package:flutter/material.dart';
import 'action_button_view_model.dart';

class ActionButton extends StatelessWidget {
  final ActionButtonViewModel viewModel;

  const ActionButton._(this.viewModel);

  static Widget instantiate({required ActionButtonViewModel viewModel}) {
    return ActionButton._(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    double buttonSize = 32.0;
    Color buttonColor = Color(0xFFF8D247);
    Color textColor = Colors.white;

    switch (viewModel.size) {
      case ActionButtonSize.large:
        buttonSize = 48.0;
        break;
      case ActionButtonSize.medium:
        buttonSize = 36.0;
        break;
      case ActionButtonSize.small:
        buttonSize = 24.0;
        break;
    }

    switch (viewModel.style) {
      case ActionButtonStyle.primary:
        buttonColor = Color(0xFF6200EA); // Purple
        textColor = Colors.white;
        break;
      case ActionButtonStyle.secondary:
        buttonColor = Color(0xFF03DAC6); // Teal
        textColor = Colors.black;
        break;
      case ActionButtonStyle.tertiary:
        buttonColor = Color(0xFFB00020); // Red
        textColor = Colors.white;
        break;
    }

    return GestureDetector(
      onTap: () {
        // Handle button tap
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Button Pressed: ${viewModel.text}')),
        );
      },
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [buttonColor.withOpacity(0.8), buttonColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius:
                BorderRadius.circular(12.0), // Arredondamento mais suave
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10.0,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12.0),
            splashColor: buttonColor.withOpacity(0.3),
            highlightColor: buttonColor.withOpacity(0.5),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (viewModel.image != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: SizedBox(
                        width: buttonSize / 2,
                        height: buttonSize / 2,
                        child: viewModel.image,
                      ),
                    ),
                  Text(
                    viewModel.text,
                    style: TextStyle(
                      fontSize: buttonSize / 2.5,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
