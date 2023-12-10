import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wubrg_app/screens/StartMenu.dart';
import 'package:wubrg_app/screens/gamePhrase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wubrg_app/screens/splash.dart';
import 'package:wubrg_app/screens/start_screen.dart';

import 'providers/card_state.dart';
import 'util/color_schemes.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://yilwoivnjbypetkfsyyo.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlpbHdvaXZuamJ5cGV0a2ZzeXlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY0NTI0NTUsImV4cCI6MjAxMjAyODQ1NX0.3zWKrWYXRDAQ6s1QB3c7wcymA642SQSJluxGXFC4C_8',
    authFlowType: AuthFlowType.pkce,
  );
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
          "/": (context) => const StartMenu(),
          "/start-game": (context) => const GamePhrase(),
          "/drafter": (context) => const StartScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
