import 'package:fifteen/settings/ui/confirmation_dialog.dart';
import 'package:fifteen/app/domain/preferences_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClearDataTile extends StatelessWidget {
  const ClearDataTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      textColor: Colors.red,
      iconColor: Colors.red,
      leading: const Icon(Icons.cancel),
      title: const Text("Reset Data"),
      onTap: () => showDialog(
        context: context,
        builder: (context) => ConfirmationDialog(
          onConfirm: () {
            Navigator.pop(context);
            Navigator.pop(context);
            deleteAdventure();
          },
        ),
      ),
    );
  }

  void deleteAdventure() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    PreferencesData(preferences: prefs).solvedBoards = [];
  }
}
