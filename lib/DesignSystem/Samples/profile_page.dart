import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/input/input_field.dart';
import 'package:untitled/DesignSystem/Components/input/input_field_view_model.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController _profileNameController = TextEditingController();
  final TextEditingController _profileEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomInputField.instantiate(
              viewModel: InputFieldViewModel(
                label: 'Profile Name',
                hint: 'Enter your profile name',
                controller: _profileNameController,
              ),
            ),
            CustomInputField.instantiate(
              viewModel: InputFieldViewModel(
                label: 'Profile Email',
                hint: 'Enter your profile email',
                keyboardType: TextInputType.emailAddress,
                controller: _profileEmailController,
              ),
            ),
            // Outros widgets podem ser adicionados aqui.
          ],
        ),
      ),
    );
  }
}
