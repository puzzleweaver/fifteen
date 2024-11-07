import 'package:fifteen/app/ui/preferences_widget.dart';
import 'package:fifteen/completion/data/completions.dart';
import 'package:fifteen/completion/data/preferences_completions.dart';
import 'package:fifteen/settings/ui/confirmation_dialog.dart';
import 'package:fifteen/app/domain/preferences_data.dart';
import 'package:flutter/material.dart';

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
        builder: (context) => PreferencesWidget(
          builder: (context, preferences) => ConfirmationDialog(
            onConfirm: () {
              deleteAdventure(preferences);
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }

  void deleteAdventure(PreferencesData preferences) {
    Completions completions = PreferencesCompletions(preferences: preferences);
    completions.deleteAll();
  }
}
