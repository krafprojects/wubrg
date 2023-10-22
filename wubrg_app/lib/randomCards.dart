import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter_test/flutter_test.dart';

void main() {
  runApp(MyApp());

  testWidgets('Testing if it generates 15 random cards correctly',
      (WidgetTester tester) async {
    //Correct 15 random cards:
    // 1 x Multiverse Legend
    // 1 x Double-Faced Battle
    // 1 x Single-Faced
    // 1 x Double-Faced
    // 2 x Uncommons
    // 8 x Commons
    // 1 x Land (Basic Land or Dual Land)
    //expect(find(Deck), matcher)
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MTG Card Viewer'),
        ),
        body: CardViewer(),
      ),
    );
  }
}

class CardViewer extends StatefulWidget {
  @override
  _CardViewerState createState() => _CardViewerState();
}

class _CardViewerState extends State<CardViewer> {
  final int numberOfCardsToShow = 15;
  List<String> cardAssets = [];
  String selectedCard = '';

  @override
  void initState() {
    super.initState();
    loadCardAssets();
  }

  Future<void> loadCardAssets() async {
    // final manifestContent = await rootBundle.loadString('AssetManifest.json');
    // final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    // final assetPaths = manifestMap.keys
    //     .where((String key) => key.startsWith('assets/image'))
    //     .toList();

    // final Random random = Random();

    // final List<String> newCardAssets = [];

    // while (newCardAssets.length < numberOfCardsToShow) {
    //   final randomIndex = random.nextInt(assetPaths.length);
    //   final randomAsset = assetPaths[randomIndex];
    //   newCardAssets.add(randomAsset);
    // }

    // setState(() {
    //   cardAssets = newCardAssets;
    // });
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final assetPaths = manifestMap.keys
        .where((String key) => key.startsWith('assets/image'))
        .toList();

    final Random random = Random();

    final List<String> newCardAssets = [];

    // Define the criteria
    final criteria = {
      'Multiverse Legend': 1,
      'Double-Faced Battle': 1,
      'Single-Faced': 1,
      'Double-Faced': 1,
      'Uncommon': 2,
      'Common': 8,
      'Land': 1,
    };

    for (final entry in criteria.entries) {
      final cardName = entry.key;
      final count = entry.value;
      final eligibleCards = List<String>.from(
          assetPaths.where((assetPath) => assetPath.contains(cardName)));

      // Ensure there are enough eligible cards to meet the count requirement
      if (eligibleCards.length < count) {
        throw Exception('Not enough cards for: $cardName');
      }

      for (var i = 0; i < count; i++) {
        final randomIndex = random.nextInt(eligibleCards.length);
        final randomAsset = eligibleCards[randomIndex];
        newCardAssets.add(randomAsset);
        // Remove the selected card from eligibleCards to avoid duplicates
        eligibleCards.removeAt(randomIndex);
      }
    }

    setState(() {
      cardAssets = newCardAssets;
    });
  }

  void onCardTap(String assetPath) {
    setState(() {
      selectedCard = assetPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: loadCardAssets,
          child: Text('Get New Cards'),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            itemCount: cardAssets.length,
            itemBuilder: (context, index) {
              final assetPath = cardAssets[index];
              return GestureDetector(
                onTap: () => onCardTap(assetPath),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150.0,
                    height: 210.0,
                    child: Card(
                      child: Image.asset(
                        assetPath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        selectedCard.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Selected Card: ${selectedCard.split('/').last}',
                  style: TextStyle(fontSize: 16),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
