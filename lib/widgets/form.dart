import 'package:contacts/util/constants.dart';
import 'package:contacts/widgets/phone_number_input.dart';
import 'package:flutter/material.dart';

class AddEditForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final String? initialName;
  final String? initialEmail;
  final String? initialNumber;

  final ValueChanged<String?> onNameSaved;
  final ValueChanged<String?> onEmailSaved;
  final ValueChanged<String?> onNumberSaved;

  const AddEditForm({
    super.key,
    this.initialName,
    this.initialEmail,
    this.initialNumber,
    required this.onNameSaved,
    required this.onEmailSaved,
    required this.onNumberSaved,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 15,
        children: [
          TextFormField(
            initialValue: initialName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a name";
              }
              return null;
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: textSecondary, width: 1),
              ),
              hintText: "Full Name",
            ),
            onSaved: onNameSaved,
          ),
          PhoneNumberInput(number: initialNumber, onSave: onNumberSaved),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            initialValue: initialEmail,
            validator: (value) {
              if (value != null && value.isNotEmpty && !value.contains('@')) {
                return "Please enter a valid email";
              }
              return null;
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: textSecondary, width: 1),
              ),
              hintText: "Email",
            ),
          ),
        ],
      ),
    );
  }
}
