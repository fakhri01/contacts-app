import 'package:contacts/util/constants.dart';
import 'package:contacts/widgets/custom_popup_menu_button.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final int id;
  final String? fullName;
  final String? mail;
  final int? phone;

  const ContactItem({
    super.key,
    required this.id,
    required this.fullName,
    required this.mail,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/contact_details_page'),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                'J',
                style: TextStyle(color: textPrimary, fontSize: 20),
              ),
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName!,
                style: TextStyle(
                  color: textPrimary,
                  fontSize: 18,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                phone.toString(),
                style: TextStyle(
                  color: textSecondary,
                  fontSize: 15,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Spacer(),
          CustomPopupMenuButton(),
        ],
      ),
    );
  }
}
