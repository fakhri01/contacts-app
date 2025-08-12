import 'package:contacts/screens/add_new_contact.dart';
import 'package:contacts/screens/contact_details_screen.dart';
import 'package:contacts/screens/contacts_screen.dart';
import 'package:contacts/screens/edit_contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
