import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/input/input_field.dart';
import 'package:untitled/DesignSystem/Components/input/input_field_view_model.dart';
import 'package:untitled/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:untitled/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart'; // Importar o arquivo ActionButtonViewModel

class SearchPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinha os botões à esquerda
          children: [
            CustomInputField.instantiate(
              viewModel: InputFieldViewModel(
                label: 'Search',
                hint: 'Enter search term',
                controller: _searchController,
              ),
            ),
            SizedBox(
                height:
                    16.0), // Espaçamento entre o campo de entrada e os botões
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                style: ActionButtonStyle.primary,
                size: ActionButtonSize.large,
                text: 'Primary Large',
              ),
            ),
            SizedBox(height: 8.0), // Espaçamento entre os botões
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                style: ActionButtonStyle.secondary,
                size: ActionButtonSize.medium,
                text: 'Secondary Medium',
              ),
            ),
            SizedBox(height: 8.0), // Espaçamento entre os botões
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                style: ActionButtonStyle.tertiary,
                size: ActionButtonSize.small,
                text: 'Tertiary Small',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
