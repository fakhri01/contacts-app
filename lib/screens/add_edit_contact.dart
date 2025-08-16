import 'package:contacts/models/contacts_model.dart';
import 'package:contacts/providers/contacts_provider.dart';
import 'package:contacts/util/constants.dart';
import 'package:contacts/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddEditContactScreen extends ConsumerStatefulWidget {
  final int? contactId;
  const AddEditContactScreen({super.key, this.contactId});

  @override
  ConsumerState<AddEditContactScreen> createState() =>
      _AddNewContactScreenState();
}

class _AddNewContactScreenState extends ConsumerState<AddEditContactScreen> {
  final _formKey = GlobalKey<FormState>();
  ContactsModel? _editingContact;

  String? _name;
  String? _email;
  String? _number;
  String? _flag;
  String? _countryCode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final contactId = ModalRoute.of(context)?.settings.arguments as int?;

    if (contactId != null) {
      _editingContact = ref.read(contactDetailFinderProvider(contactId));
      if (_editingContact != null) {
        _name = _editingContact!.name;
        _email = _editingContact!.email;
        _number = _editingContact!.number;
        _flag = _editingContact!.flag;
        _countryCode = _editingContact!.countryCode;
      }
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final notifier = ref.read(contactsProvider.notifier);
      if (_editingContact != null) {
        final updatedContact = ContactsModel(
          id: _editingContact!.id,
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
      Navigator.of(context).pop();
    }
  }

  void addPictureSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Center(child: Text("Didn't learn that much yet:)"))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _editingContact != null ? 'Update contact' : 'Create Contact',
          style: TextStyle(
            color: textPrimary,
            fontSize: 20,
            fontFamily: fontFamily,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: _saveForm,
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: Text(
              "Save",
              style: TextStyle(color: textPrimary, fontFamily: fontFamily),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: 50, bottom: 20),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(Icons.add_a_photo_rounded, color: textPrimary),
              ),

              GestureDetector(
                onTap: () => addPictureSnackbar(),
                child: Text(
                  "Add picture",
                  style: TextStyle(color: primaryColor, fontFamily: fontFamily),
                ),
              ),
              SizedBox(height: 50),
              AddEditForm(
                formKey: _formKey,
                initialName: _name,
                initialEmail: _email,
                initialNumber: _number,
                initialCountryCode: _countryCode,
                onNameSaved: (value) => _name = value ?? '',
                onEmailSaved: (value) => _email = value ?? '',
                onNumberSaved: (result) {
                  _number = result.number;
                  _flag = result.country?.flag ?? '';
                  _countryCode = result.country?.code ?? '';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
