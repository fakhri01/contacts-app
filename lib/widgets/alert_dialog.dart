import 'package:contacts/providers/contacts_provider.dart';
import 'package:contacts/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlertDialogWidget extends ConsumerWidget {
  final int id;
  const AlertDialogWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(
        "Are you sure?",
        style: TextStyle(color: textPrimary, fontFamily: fontFamily),
      ),
      content: Text(
        "This action cannot be undone",
        style: TextStyle(color: textSecondary, fontFamily: fontFamily),
      ),
      actions: [
        TextButton(
          child: Text("No"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text("Yes"),
          onPressed: () {
            ref.read(contactsProvider.notifier).deleteContact(id);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
