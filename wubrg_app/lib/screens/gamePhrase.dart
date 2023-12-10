import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wubrg_app/screens/EndGamePhrasse.dart';
import 'package:wubrg_app/services/database_service.dart';
import '../providers/card_state.dart';
import '../services/ImageManager.dart';

class GamePhrase extends StatelessWidget {
  const GamePhrase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WURB Drafter"),
        elevation: 1,
      ),
      body: ImageSlider(),
    );
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key});

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final ImageManager _imageManager = ImageManager();
  List<String> images = [];
  int currentIndex = 0;
  List<String> selectedImages = [];
  int cardTotal = 15; // Initialize cardTotal with the total number of cards
  int resetCount = 1; // Initialize reset count
  bool magnifyVisible = false;
  int magnifyIndex = 0;

  @override
  void initState() {
    super.initState();
    List<String> allImages = _imageManager.randomImages;
    images = allImages.take(cardTotal).toList();
  }

  void _nextImage() {
    setState(() {
      if (images.length > 1) {
        images.removeAt(0);
      }
    });
  }

  void _selectCard() {
    setState(() {
      // Add the currently displayed image to the selectedImages list
      selectedImages.add(images[currentIndex]);

      // Remove the selected image from the images list
      images.removeAt(currentIndex);

      // Decrement cardTotal and use the decremented value
      cardTotal--;
      currentIndex = 0;
    });

    // Check if selectedImages has reached 15 or 30
    if (selectedImages.length == 15 || selectedImages.length == 30) {
      print("You have selected ${selectedImages.length} images. Resetting...");
      _resetSlider();
    } else if (selectedImages.length == 45) {
      print("You have selected 45 images. Score counting...");
      _navigateToEndGamePhrase();
    }
  }

  void _navigateToEndGamePhrase() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const EndGamePhrase(
                title: 'Scoring',
              )),
    );
  }

  void _resetSlider() {
    setState(() {
      // Increment reset count
      resetCount++;

      // Reset cardTotal to 15
      cardTotal = 15;

      // Repopulate images list with random images
      images = _imageManager.randomImages.take(cardTotal).toList();
    });
  }

  void _toggleMagnifyView(int index) {
    setState(() {
      magnifyIndex = index;
      magnifyVisible = !magnifyVisible;
    });
  }

  Widget _buildMagnifyView() {
    if (magnifyVisible) {
      return Positioned.fill(
        child: PageView.builder(
          itemCount: selectedImages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _toggleMagnifyView(-1), // Close magnify view
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      selectedImages[index],
                      fit: BoxFit.contain,
                    ),
                    Text('Tap to exit.'),
                  ],
                ),
              ),
            );
          },
          onPageChanged: (index) {
            setState(() {
              magnifyIndex = index;
            });
          },
        ),
      );
    } else {
      return Container(); // Empty container if magnified view is not visible
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardst = Provider.of<CardState>(context);
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (selectedImages.isNotEmpty)
                SizedBox(
                  height: 100,
                  child: GestureDetector(
                    onTap: () => _toggleMagnifyView(currentIndex),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset(selectedImages[index]),
                        );
                      },
                    ),
                  ),
                ),
              SizedBox(
                height: 400,
                child: PageView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Image.asset(images[index]);
                  },
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              ElevatedButton(
                // onPressed: _selectCard,
                onPressed: () {
                  // cardst.setRandomCardSet();
                  print("Card set length: ${cardst.randomCardSet.length}");
                },
                child: Text('Select Card'),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Cards: $cardTotal',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Pack: $resetCount',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Total cards selected: ${selectedImages.length}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildMagnifyView(),
        ],
      ),
    );
  }
}
