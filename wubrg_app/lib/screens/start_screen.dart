import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wubrg_app/models/card_wubrg.dart';

import '../providers/card_state.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardState = Provider.of<CardState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("WUBRG Drafter"),
        elevation: 1,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "${cardState.userCardSet.length}/45",
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
            const Center(
              child: Text(
                "Current picks",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cardState.userCardSet.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150.0,
                    margin: const EdgeInsets.only(right: 12),
                    color: Colors.blue,
                    child: Center(
                      child: Image.network(
                          cardState.userCardSet[index].face_front.image_uri),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Center(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "1/4",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  "Current Set",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                alignment: Alignment.center,
                height: 400,
                child: cardState.randomCardSet.isNotEmpty
                    ? CarouselSlider.builder(
                        itemCount: cardState.randomCardSet.length,
                        options: CarouselOptions(
                          onPageChanged: (index, reason) =>
                              cardState.updateCarouselIndex(index),
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                          // disableCenter: true,
                          height: 400,
                          autoPlay: false,
                          // aspectRatio: 2.0,
                          enlargeCenterPage: true,
                        ),
                        itemBuilder: (context, index, realIndex) {
                          return Image.network(cardState
                              .randomCardSet[index].face_front.image_uri);
                        },
                      )
                    : const Placeholder(fallbackHeight: 400),
              ),
              // child: Placeholder(
              //   fallbackHeight: 400,
              // ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Text(
                  "Cards remaining in set: ${cardState.randomCardSet.length}"),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  int index = cardState.carouselIndex;
                  CardWubrg card = cardState.randomCardSet[index];
                  cardState.addToUserCardSet(card);
                  cardState.removeFromRandomCardSet(card);
                  print(cardState.userCardSet.length);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("CHOOSE", style: TextStyle(fontSize: 18)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
