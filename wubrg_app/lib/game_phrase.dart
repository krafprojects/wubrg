import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Phrase Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GamePhrase(title: 'Game Phrase'),
    );
  }
}

class GamePhrase extends StatefulWidget {
  const GamePhrase({super.key, required this.title});

  final String title;

  @override
 
  State<GamePhrase> createState() => _GamePhraseState();
}

class _GamePhraseState extends State<GamePhrase> {
  // List of image paths
  final List<String> imagePaths = [
    'assets/image1.jpg', 
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg',
    'assets/image6.jpg',
    'assets/image7.jpg',
    'assets/image8.jpg',
    'assets/image9.jpg',
    'assets/image10.jpg',
    'assets/image11.jpg',
    'assets/image12.jpg',
    'assets/image13.jpg',
    'assets/image14.jpg',
    'assets/image15.jpg',
    // Add more image paths as needed
  ];

  // This is the Widget that can display the cards
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          childAspectRatio: 1.0, 
        ),
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
              imagePaths[index],
              width: 150, // Adjust the width as needed
              height: 150, // Adjust the height as needed
            );

        },
        itemCount: imagePaths.length, // Total number of images to display
      ),
    );
  }
}