import 'package:fifteen/app/domain/preferences_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesWidget extends StatefulWidget {
  final Widget Function(BuildContext context, PreferencesData data) builder;
  const PreferencesWidget({super.key, required this.builder});

  @override
  State<StatefulWidget> createState() => PreferencesWidgetState();
}

class PreferencesWidgetState extends State<PreferencesWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        SharedPreferences? preferences = snapshot.data;
        if (preferences == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return widget.builder(
          context,
          PreferencesData(preferences: preferences),
        );
      },
    );
  }
}
