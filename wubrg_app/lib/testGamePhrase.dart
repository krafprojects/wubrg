import 'package:flutter/material.dart';
import 'package:wubrg_app/ImageManager.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final ImageManager _imageManager = ImageManager(); // Create an instance

  List<String> images = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Get a list of random images from the ImageManager
    images = _imageManager.randomImages;
  }

  //duplicate function
  void _nextImage() {
    setState(() {
      // Remove the currently displayed image from the list
      images.removeAt(currentIndex);

      // Check if all images have been displayed, and if so, reset the list
      if (images.isEmpty) {
        images = _imageManager.randomImages;
        currentIndex = 0;
      } else {
        // Make sure currentIndex is within bounds
        currentIndex = currentIndex % images.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600, // Set the height of your slider as per your requirements
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
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Wubrg Slider'),
        ),
        body: Center(
          child: ImageSlider(),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
