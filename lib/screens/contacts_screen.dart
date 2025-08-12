import 'package:contacts/util/constants.dart';
import 'package:contacts/widgets/contact_item.dart';
import 'package:contacts/widgets/create_new_contact.dart';
import 'package:contacts/widgets/search.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Contacts App",
            style: TextStyle(color: textPrimary, fontFamily: fontFamily),
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          spacing: 12,
          children: [
            Search(),
            SizedBox(height: 5),
            CreateNewContact(),
            SizedBox(height: 5),
            ContactItem(),
            ContactItem(),
            ContactItem(),
            ContactItem(),
            ContactItem(),
            ContactItem(),
            ContactItem(),
            ContactItem(),
            ContactItem(),
            ContactItem(),
            ContactItem(),
            ContactItem(),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          color: textPrimary,
          icon: Icon(Icons.dialpad_outlined),
          onPressed: () => Navigator.pushNamed(context, '/add_new_contact'),
        ),
      ),
    );
  }
}
