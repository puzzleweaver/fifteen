import 'package:fifteen/app/domain/preferences.dart';
import 'package:fifteen/completion/data/completions.dart';
import 'package:fifteen/completion/data/preferences_completions.dart';
import 'package:fifteen/settings/ui/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClearDataTile extends StatelessWidget {
  const ClearDataTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: ListTile(
        leading: const Icon(Icons.cancel),
        title: const Text("Reset Data"),
        onTap: () => showDialog(
          context: context,
          builder: (context) => ConfirmationDialog(
            onConfirm: () {
              deleteAdventure(context);
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }

  void deleteAdventure(BuildContext context) {
    Preferences prefs = Provider.of(context, listen: false);
    Completions completions = PreferencesCompletions(prefs: prefs);
    completions.deleteAll();
  }
}
