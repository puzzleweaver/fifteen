import 'package:fifteen/main.dart';
import 'package:fifteen/settings/ui/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsIconButton extends StatelessWidget {
  const SettingsIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () => goToSettings(context),
    );
  }

  void goToSettings(BuildContext context) {
    Provider.of<FifteenAppState>(context, listen: false).rerollAds();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }
}
