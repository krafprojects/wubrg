import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
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
    final response = await Supabase.instance.client.from('cards').select()
      .order('random()') // This orders the rows randomly
      .limit(15) // Limit the result to 15 rows
      ;

    if (response.error != null) {
      // Handle error
      print('Error fetching data from Supabase: ${response.error!.message}');
    } else {
      List<dynamic> data = response.data;
      List<String> newCardAssets = [];

      for (var item in data) {
        // Assuming your data contains URLs to card images
        newCardAssets.add(item['image_url'] as String);
        
      }

      setState(() {
        cardAssets = newCardAssets;
      });
    }

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
