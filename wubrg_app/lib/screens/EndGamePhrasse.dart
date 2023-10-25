import 'package:flutter/material.dart';
import 'GamePhrase.dart'; // Import the destination file (gamephrase.dart)

void main() {
  runApp(const EndGame());
}

class EndGame extends StatelessWidget {
  const EndGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'End Game Phrase'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Your Score:',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(height: 30), // Add a SizedBox for a bigger gap
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    '97',
                    style: TextStyle(fontSize: 70),
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Share on Social Media',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    // Navigate to the GamePhrase widget when the button is pressed
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => GamePhrase()),
                    );
                  },
                  child: const Text(
                    'Play again',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.center,
                  child: ExpansionTile(
                    title: Text('What you could have done better'),
                    children: <Widget>[
                      ListTile(
                        title: Text('This is what the AI picked.'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
