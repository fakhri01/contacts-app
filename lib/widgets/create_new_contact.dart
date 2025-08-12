import 'package:contacts/util/constants.dart';
import 'package:flutter/material.dart';

class CreateNewContact extends StatelessWidget {
  const CreateNewContact({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/add_new_contact'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_add_alt_1, color: primaryColor),
          SizedBox(width: 10),
          Text(
            'Create new contact',
            style: TextStyle(
              color: primaryColor,
              fontFamily: fontFamily,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
