import 'package:contacts/util/constants.dart';
import 'package:contacts/widgets/contact_item.dart';
import 'package:contacts/widgets/search.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
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
    );
  }
}
