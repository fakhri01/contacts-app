import 'package:contacts/models/country_model.dart';
import 'package:contacts/util/constants.dart';
import 'package:contacts/widgets/phone_number_input.dart';
import 'package:flutter/material.dart';

class AddEditForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  final String? initialName;
  final String? initialEmail;
  final String? initialNumber;
  final String? initialFlag;
  final String? initialCountryCode;

  final ValueChanged<String?> onNameSaved;
  final ValueChanged<String?> onEmailSaved;
  final ValueChanged<({String? number, CountryModel? country})> onNumberSaved;

  const AddEditForm({
    super.key,
    this.initialName,
    this.initialEmail,
    this.initialNumber,
    required this.onNameSaved,
    required this.onEmailSaved,
    required this.onNumberSaved,
    required this.formKey,
    this.initialFlag,
    this.initialCountryCode,
  });

  @override
  State<AddEditForm> createState() => _AddEditFormState();
}

class _AddEditFormState extends State<AddEditForm> {
  CountryModel? selectedCountry;
  String? phoneNumber;

  @override
  void initState() {
    super.initState();
    phoneNumber = widget.initialNumber;
    if (widget.initialCountryCode != null) {
      selectedCountry = countries.firstWhere(
        (country) => country.code == widget.initialCountryCode,
        orElse: () => countries.firstWhere((c) => c.code == "+1"),
      );
    } else {
      selectedCountry = countries.firstWhere((country) => country.code == '+1');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        spacing: 15,
        children: [
          TextFormField(
            initialValue: widget.initialName,
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
            onSaved: widget.onNameSaved,
          ),
          PhoneNumberInput(
            number: phoneNumber,
            initialCountryCode: widget.initialCountryCode,
            onSave: (result) {
              setState(() {
                phoneNumber = result.number;
                selectedCountry = result.country;
                widget.onNumberSaved(result);
              });
            },
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            initialValue: widget.initialEmail,
            onSaved: widget.onEmailSaved,
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
