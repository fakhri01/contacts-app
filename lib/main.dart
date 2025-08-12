import 'package:contacts/screens/add_new_contact.dart';
import 'package:contacts/screens/contact_details_screen.dart';
import 'package:contacts/screens/contacts_screen.dart';
import 'package:contacts/screens/edit_contact_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
      initialRoute: '/',
      routes: {
        '/': (context) => ContactsScreen(),
        '/contact_details_page': (context) => ContactDetailsScreen(),
        '/edit_contact': (context) => EditContactScreen(),
        '/add_new_contact': (context) => AddNewContactScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
