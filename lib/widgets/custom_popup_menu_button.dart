import 'package:contacts/widgets/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:contacts/util/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum MenuAction { edit, delete }

class CustomPopupMenuButton extends ConsumerWidget {
  final int id;

  const CustomPopupMenuButton({super.key, required this.id});

  void onActionSelected(
    BuildContext context,
    MenuAction action,
    WidgetRef ref,
  ) {
    switch (action) {
      case MenuAction.edit:
        Navigator.pushNamed(context, '/add_edit_contact', arguments: id);
        break;
      case MenuAction.delete:
        showDialog(
          context: context,
          builder: (context) => AlertDialogWidget(id: id),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<MenuAction>(
      onSelected: (MenuAction action) {
        onActionSelected(context, action, ref);
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
