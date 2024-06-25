import 'dart:math';

import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) => {}),
                  Text("Locked Stuff"),
                ],
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) => {}),
                  Text("Time Trials"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.attach_money),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => _supportDialog(),
                      );
                    },
                    label: Text("Support the Dev"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _supportDialog() {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Gimme Money", style: TextStyle(fontSize: 28)),
          Row(
            children: [
              Checkbox(value: true, onChanged: (value) => {}),
              Text("Interstitial Ads"),
            ],
          ),
          Row(
            children: [
              Text("Ad Chance"),
              Slider(value: Random().nextDouble(), onChanged: (value) => {}),
            ],
          ),
          ElevatedButton(
            onPressed: () => print("THANKS"),
            child: Text("Donate :)"),
          ),
        ],
      ),
    );
  }
}
