import 'package:flutter/material.dart';
import 'package:contacts/util/constants.dart';

enum MenuAction { edit, delete }

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({super.key});

  void onActionSelected(BuildContext context, MenuAction action) {
    switch (action) {
      case MenuAction.edit:
        Navigator.pushNamed(context, '/edit_contact');
        break;
      case MenuAction.delete:
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Delete button tapped!')));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuAction>(
      onSelected: (MenuAction action) {
        onActionSelected(context, action);
      },
      color: backgroundColor,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuAction>>[
        PopupMenuItem<MenuAction>(
          value: MenuAction.edit,
          child: Row(
            children: [
              Icon(Icons.edit, color: textPrimary),
              SizedBox(width: 8),
              Text(
                'Edit',
                style: TextStyle(
                  color: textPrimary,
                  fontSize: 17,
                  fontFamily: fontFamily,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem<MenuAction>(
          value: MenuAction.delete,
          child: Row(
            children: [
              Icon(Icons.delete, color: textPrimary),
              SizedBox(width: 8),
              Text(
                'Delete',
                style: TextStyle(
                  color: textPrimary,
                  fontSize: 17,
                  fontFamily: fontFamily,
                ),
              ),
            ],
          ),
        ),
      ],
      icon: const Icon(Icons.more_vert),
    );
  }
}
