import 'package:contacts/util/constants.dart';
import 'package:flutter/material.dart';

class ContactInfoCard extends StatelessWidget {
  const ContactInfoCard({super.key, required this.title, required this.label});

  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: textSecondary),
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: textSecondary,
              fontFamily: fontFamily,
              fontSize: 13,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: textPrimary,
              fontFamily: fontFamily,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
