import 'package:contacts/providers/contacts_provider.dart';
import 'package:contacts/util/constants.dart';
import 'package:contacts/widgets/action_button.dart';
import 'package:contacts/widgets/contact_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactDetailsScreen extends ConsumerWidget {
  const ContactDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactId = ModalRoute.of(context)!.settings.arguments as int;
    final contact = ref.watch(contactFinderProvider(contactId));

    if (contact == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Contact Details",
            style: TextStyle(color: textPrimary, fontFamily: fontFamily),
          ),
          backgroundColor: primaryColor,
        ),
        body: Center(
          child: Text(
            "Contac not found!",
            style: TextStyle(
              color: textSecondary,
              fontSize: 24,
              fontFamily: fontFamily,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('contact detail')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: primaryColor,
              ),
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  contact.name != null ? contact.name![0] : '',
                  style: TextStyle(
                    color: textPrimary,
                    fontFamily: fontFamily,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              contact.name != null ? contact.name! : '',
              style: TextStyle(
                color: textPrimary,
                fontSize: 22,
                fontFamily: fontFamily,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionButton(
                  icon: Icons.message_outlined,
                  onPressed: () => "",
                  title: "Message",
                ),
                ActionButton(
                  icon: Icons.call_end_outlined,
                  onPressed: () => "",
                  title: "Call",
                ),
                ActionButton(
                  icon: Icons.video_call_outlined,
                  onPressed: () => "",
                  title: "Vide Call",
                ),
              ],
            ),

            ContactInfoCard(title: 'Mobile', label: contact.number.toString()),
            ContactInfoCard(title: 'Email', label: contact.email),
          ],
        ),
      ),
    );
  }
}
