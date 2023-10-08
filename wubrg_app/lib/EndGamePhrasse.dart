import 'package:flutter/material.dart';
import 'GamePhrase.dart'; // Import the destination file (gamephrase.dart)


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'End Game Phrase'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Your Score:',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(height: 30), // Add a SizedBox for a bigger gap
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '97',
                    style: TextStyle(fontSize: 70),
                  ),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Share on Social Media',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(height: 30),

                TextButton(
                  onPressed: () {
                    // Navigate to the GamePhrase widget when the button is pressed
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => gamephrase()),
                    );
                  },
                  child: Text(
                    'Play again',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
