import 'dart:async';

import 'package:fifteen/home/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  // initialize ad stuff
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(MobileAds.instance.initialize());

  runApp(const FifteenApp());
}

class FifteenApp extends StatelessWidget {
  const FifteenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fifteen',
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: const ColorScheme(
          primary: Colors.blue,
          onPrimary: Colors.black,
          secondary: Colors.green,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Color.fromARGB(255, 254, 0, 0),
          surface: Color.fromARGB(34, 232, 240, 255),
          onSurface: Color(0xFF241E30),
          brightness: Brightness.light,
          surfaceBright: Colors.green,
        ),
        fontFamily: "Courier",
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
