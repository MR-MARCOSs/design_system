import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/input/input_field.dart';
import 'package:untitled/DesignSystem/Components/input/input_field_view_model.dart';
import 'package:untitled/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:untitled/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:untitled/DesignSystem/Components/TopBar/top_bar.dart';
import 'package:untitled/DesignSystem/Components/TopBar/top_bar_view_model.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        viewModel: TopBarViewModel(
          title: 'Home Page',
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Handle search action
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notifications action
              },
            ),
          ],
          style: TopBarStyle.light,
          backgroundColor: Colors.blue,
          titleColor: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinha os elementos à esquerda
          children: [
            CustomInputField.instantiate(
              viewModel: InputFieldViewModel(
                label: 'Name',
                hint: 'Enter your name',
                controller: _nameController,
              ),
            ),
            SizedBox(height: 16.0), // Espaçamento entre campos de entrada
            CustomInputField.instantiate(
              viewModel: InputFieldViewModel(
                label: 'Email',
                hint: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ),
            ),
            SizedBox(
                height: 24.0), // Espaçamento entre o último campo e os botões
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
            // Outros widgets podem ser adicionados aqui.
          ],
        ),
      ),
    );
  }
}
