import 'package:flutter/material.dart';
import 'GamePhrase.dart'; // Import the destination file (gamephrase.dart)

void main() {
  runApp(const StartMenu());
}

class StartMenu extends StatelessWidget {
  const StartMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'StartMenu'),
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
                const SizedBox(height: 100), // Add a SizedBox for a bigger gap
                const Align(
                  alignment: Alignment.center,
                 child: Text(
                    'WUBRG',
                    style: TextStyle(fontSize: 80),
                  ),
                ),
                const SizedBox(height: 100),
                TextButton(
                  onPressed: () {
                    // Navigate to the GamePhrase widget when the button is pressed
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => GamePhrase()),
                    );
                  },
                  child: const Text(
                    'Start Playing',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                const SizedBox(height: 50),
                const Align(
                  alignment: Alignment.center,
                 child: Text(
                    'Rules',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const SizedBox(height: 230),
                const Align(
                  alignment: Alignment.center,
                 child: Text(
                    'Terms & policy',
                    style: TextStyle(fontSize: 10),
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