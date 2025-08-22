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
      _AddEditContactScreenState();
}

class _AddEditContactScreenState extends ConsumerState<AddEditContactScreen> {
  int? _contactId;
  VoidCallback? _saveFormFunction;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _contactId =
        ModalRoute.of(context)?.settings.arguments as int? ?? widget.contactId;
  }

  void addPictureSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Center(child: Text("Didn't learn that much yet:)"))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final contact = _contactId != null
        ? ref.watch(contactDetailFinderProvider(_contactId!))
        : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          contact != null ? 'Update contact' : 'Create Contact',
          style: TextStyle(
            color: textPrimary,
            fontSize: 20,
            fontFamily: fontFamily,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => _saveFormFunction?.call(),
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
                contactId: _contactId,
                onSaved: () => Navigator.of(context).pop(),
                onSaveCallback: (saveFunction) =>
                    _saveFormFunction = saveFunction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
