import 'package:flutter/material.dart';
import '../services/ImageManager.dart';

void main() {
  runApp(const GamePhrase());
}

class GamePhrase extends StatelessWidget {
  const GamePhrase({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageSlider(),
      ),
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

  @override
  void initState() {
    super.initState();
    List<String> allImages = _imageManager.randomImages;
    images =
        allImages.take(cardTotal).toList(); // Use the initial cardTotal value
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
      images = _imageManager.randomImages.take(cardTotal).toList();
      currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (selectedImages.isNotEmpty)
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectedImages.length,
                itemBuilder: (context, index) {
                  return Image.asset(selectedImages[index]);
                },
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
            onPressed: _selectCard,
            child: Text('Select Card'),
          ),
          Align(
            alignment: Alignment.bottomLeft, // Align the text to the left
            child: Text(
              'Total Cards: $cardTotal', // Use cardTotal here
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
