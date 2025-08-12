import 'package:contacts/util/constants.dart';
import 'package:contacts/widgets/action_button.dart';
import 'package:contacts/widgets/contact_info_card.dart';
import 'package:flutter/material.dart';

class ContactDetailsScreen extends StatefulWidget {
  const ContactDetailsScreen({super.key});

  @override
  State<ContactDetailsScreen> createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  @override
  Widget build(BuildContext context) {
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
                  "J",
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
              "John Doe",
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

            ContactInfoCard(title: 'Mobile', label: '1234567789'),
            ContactInfoCard(title: 'Email', label: 'example@mail.com'),
          ],
        ),
      ),
    );
  }
}
