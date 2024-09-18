import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/input/input_field.dart';
import 'package:untitled/DesignSystem/Components/input/input_field_view_model.dart';

class NotificationsPage extends StatelessWidget {
  final TextEditingController _notificationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomInputField.instantiate(
              viewModel: InputFieldViewModel(
                label: 'Notification',
                hint: 'Enter notification details',
                controller: _notificationController,
              ),
            ),
            // Outros widgets podem ser adicionados aqui.
          ],
        ),
      ),
    );
  }
}
