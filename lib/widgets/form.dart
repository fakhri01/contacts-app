import 'package:contacts/util/constants.dart';
import 'package:contacts/widgets/phone_number_input.dart';
import 'package:flutter/material.dart';

class AddEditForm extends StatefulWidget {
  const AddEditForm({super.key});

  @override
  State<AddEditForm> createState() => _AddEditFormState();
}

class _AddEditFormState extends State<AddEditForm> {
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 15,
        children: [
          TextFormField(
            controller: fullNameController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: textSecondary, width: 1),
              ),
              hintText: "Full Name",
            ),
          ),
          PhoneNumberInput(),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: fullNameController,

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
