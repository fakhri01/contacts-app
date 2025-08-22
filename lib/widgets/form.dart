import 'package:contacts/models/contacts_model.dart';
import 'package:contacts/models/country_model.dart';
import 'package:contacts/providers/contacts_provider.dart';
import 'package:contacts/util/constants.dart';
import 'package:contacts/widgets/phone_number_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddEditForm extends ConsumerStatefulWidget {
  final int? contactId;
  final VoidCallback? onSaved;
  final void Function(VoidCallback saveFunction)? onSaveCallback;

  const AddEditForm({
    super.key,
    this.contactId,
    this.onSaved,
    this.onSaveCallback,
  });

  @override
  ConsumerState<AddEditForm> createState() => _AddEditFormState();
}

class _AddEditFormState extends ConsumerState<AddEditForm> {
  final _formKey = GlobalKey<FormState>();
  CountryModel? selectedCountry;

  String? _name;
  String? _email;
  String? _number;
  String? _flag;
  String? _countryCode;

  @override
  void initState() {
    super.initState();
    selectedCountry = countries.firstWhere((country) => country.code == "+1");

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onSaveCallback?.call(saveForm);
    });
  }

  void saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final notifier = ref.read(contactsProvider.notifier);

      if (widget.contactId != null) {
        final updatedContact = ContactsModel(
          id: widget.contactId!,
          name: _name ?? '',
          email: _email ?? '',
          number: _number ?? '',
          flag: _flag ?? '',
          countryCode: _countryCode ?? '',
        );
        notifier.editContact(updatedContact);
      } else {
        final newContact = ContactsModel(
          id: 0,
          name: _name ?? '',
          email: _email ?? '',
          number: _number ?? '',
          flag: _flag ?? '',
          countryCode: _countryCode ?? '',
        );
        notifier.addContact(newContact);
      }
      widget.onSaved?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final contact = widget.contactId != null
        ? ref.watch(contactDetailFinderProvider(widget.contactId!))
        : null;
    if (contact != null) {
      final contactCountry = countries.firstWhere(
        (country) =>
            country.code == contact.countryCode && country.flag == contact.flag,
        orElse: () => countries.firstWhere((c) => c.code == '+1'),
      );
      if (selectedCountry != contactCountry) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            selectedCountry = contactCountry;
          });
        });
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        spacing: 15,
        children: [
          TextFormField(
            initialValue: contact?.name,
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
            onSaved: (value) => _name = value ?? '',
          ),
          PhoneNumberInput(
            number: contact?.number,
            initialFlag: contact?.flag ?? selectedCountry?.flag,
            initialCountryCode: contact?.countryCode ?? selectedCountry?.code,
            onSave: (result) {
              setState(() {
                _number = result.number;
                _flag = result.country?.flag ?? '';
                _countryCode = result.country?.code ?? '';
                selectedCountry = result.country;
              });
            },
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            initialValue: contact?.email,
            onSaved: (value) => _email = value ?? '',
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
