import 'package:contacts/util/constants.dart';
import 'package:contacts/widgets/form.dart';
import 'package:flutter/material.dart';

class AddNewContactScreen extends StatefulWidget {
  const AddNewContactScreen({super.key});

  @override
  State<AddNewContactScreen> createState() => _AddNewContactScreenState();
}

class _AddNewContactScreenState extends State<AddNewContactScreen> {
  void addPictureSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Center(child: Text("Didn't learn that much :)"))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create contact',
          style: TextStyle(
            color: textPrimary,
            fontSize: 20,
            fontFamily: fontFamily,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => 'Save',
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
              AddEditForm(),
            ],
          ),
        ),
      ),
    );
  }
}
