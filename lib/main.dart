import 'dart:async';

import 'package:fifteen/app/domain/preferences.dart';
import 'package:fifteen/app/domain/preferences_data.dart';
import 'package:fifteen/board/data/file_boards.dart';
import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/home/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // initialize ad stuff
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(MobileAds.instance.initialize());

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        FutureProvider<List<Board>>(
          create: (BuildContext context) => FileBoards(context).sequence(),
          initialData: [],
        ),
        ChangeNotifierProvider<Preferences>(
          create: (BuildContext context) => Preferences(
            PreferencesData(
              preferences: sharedPreferences,
            ),
          ),
        ),
        // FutureProvider<Boards>(
        //   initialData: EmptyBoards(),
        //   create: (BuildContext context) => FileBoards(context),
        // ),
      ],
      child: const FifteenApp(),
    ),
  );
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
