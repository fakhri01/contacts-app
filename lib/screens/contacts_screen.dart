import 'package:contacts/providers/contacts_provider.dart';
import 'package:contacts/util/constants.dart';
import 'package:contacts/widgets/contact_item.dart';
import 'package:contacts/widgets/create_new_contact.dart';
import 'package:contacts/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactsScreen extends ConsumerStatefulWidget {
  const ContactsScreen({super.key});

  @override
  ConsumerState<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends ConsumerState<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    final allContacs = ref.watch(filteredContactsProvider);

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
      body: Column(
        spacing: 12,
        children: [
          Search(),
          SizedBox(height: 5),
          CreateNewContact(),
          SizedBox(height: 5),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: allContacs.length,
              itemBuilder: (context, index) => ContactItem(
                id: allContacs[index].id,
                fullName: allContacs[index].name,
                mail: allContacs[index].email,
                phone: allContacs[index].number,
              ),
              separatorBuilder: (context, index) => SizedBox(height: 12),
            ),
          ),
        ],
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
          onPressed: () => Navigator.pushNamed(context, '/add_edit_contact'),
        ),
      ),
    );
  }
}
