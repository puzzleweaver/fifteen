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
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Gimme Ur Money >:("),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
