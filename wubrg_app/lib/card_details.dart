import 'package:flutter/material.dart';

void main() {
  runApp(const MtgCardViewerApp());
}

class MtgCardViewerApp extends StatelessWidget {
  const MtgCardViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MTG Card Viewer',
      home: MtgCardViewer(),
    );
  }
}

class MtgCardViewer extends StatefulWidget {
  const MtgCardViewer({super.key});

  @override
  State<MtgCardViewer> createState() => _MtgCardViewerState();
}

class _MtgCardViewerState extends State<MtgCardViewer> {
  double zoomLevel = 1.0;
  int currentScore = 0; // Initialize the current score here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MTG Card Viewer'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onScaleUpdate: (details) {
                setState(() {
                  zoomLevel = details.scale;
                });
              },
              child: Container(
                width: 300 * zoomLevel,
                height: 420 * zoomLevel,
                decoration: BoxDecoration(
                  color: Colors.blue, // Background color of the card
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/image1.jpg', // Update with your image path
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Current Score',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  currentScore.toString(),
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              if (zoomLevel < 2.0) {
                setState(() {
                  zoomLevel += 0.1;
                });
              }
            },
            child: const Text('Zoom In'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (zoomLevel > 0.5) {
                setState(() {
                  zoomLevel -= 0.1;
                });
              }
            },
            child: const Text('Zoom Out'),
          ),
        ],
      ),
    );
  }
}