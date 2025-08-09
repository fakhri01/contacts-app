import 'package:contacts/util/constants.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 90,
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          border: Border.all(width: 1, color: primaryColor),
        ),
        child: Column(
          children: [
            Icon(icon, color: textPrimary),
            Text(
              title,
              style: TextStyle(color: textPrimary, fontFamily: fontFamily),
            ),
          ],
        ),
      ),
    );
  }
}
