import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wubrg_app/screens/StartMenu.dart';
import 'package:wubrg_app/screens/gamePhrase.dart';

import 'providers/card_state.dart';
import 'util/color_schemes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CardState()),
      ],
      child: MaterialApp(
        title: 'WUBRG',
        // theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        initialRoute: "/",
        routes: {
          "/": (context) => StartMenu(),
          "/start-game": (context) => GamePhrase(),
        },
      ),
    );
  }
}
