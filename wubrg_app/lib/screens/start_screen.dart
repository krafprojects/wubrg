import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wubrg_app/models/card_wubrg.dart';
import 'package:wubrg_app/themes/theme.dart' as Theme;

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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.Colores.loginGradientEnd,
              Theme.Colores.loginGradientStart
            ],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Center(
                    child: Text(
                      "Current picks",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "${cardState.userCardSet.length}/45",
                          style:
                              const TextStyle(fontSize: 24, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        "Current Set",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "1/4",
                          style: TextStyle(fontSize: 24, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
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
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                          side: MaterialStateProperty.all(
                            const BorderSide(
                              color: Color.fromARGB(255, 17, 133, 183),
                              width: 2,
                            ),
                          ),
                    ),
                    onPressed: () {
                      int index = cardState.carouselIndex;
                      CardWubrg card = cardState.randomCardSet[index];
                      cardState.addToUserCardSet(card);
                      cardState.removeFromRandomCardSet(card);
                      // print(cardState.userCardSet.length);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("CHOOSE", style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
