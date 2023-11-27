import 'package:flutter/material.dart';

import '../models/card_wubrg.dart';
import '../services/card_service.dart';

// - Card Set Requiriments - //
// 1x Legend
// 1x Double Faced Battle
// 1x Single Faced U R M
// 1x Double Faced U R M
// 2x Uncommons
// 8x Commons
// 1x Land

class CardState extends ChangeNotifier {
  List<CardWubrg> userCardSet = [];
  List<CardWubrg> randomCardSet = [];

  int carouselIndex = 0;

  Future<void> generateRandomCardSet() async {
    CardWubrg legend = (await getRandomLegendCard());
    CardWubrg doubleFBattle = (await getRandomDoubleFacedBattleCard());
    CardWubrg singleFaced = (await getRandomSingleFacedCard());
    CardWubrg doubleFaced = (await getRandomDoubleFacedCard());
    List<CardWubrg> uncommons =
        (await getRandomUncommonCard()).cast<CardWubrg>();
    List<CardWubrg> commons = (await getRandomCommonCard()).cast<CardWubrg>();

    // randomCardSet = [];

    randomCardSet.add(legend);
    randomCardSet.add(doubleFBattle);
    randomCardSet.add(singleFaced);
    randomCardSet.add(doubleFaced);
    randomCardSet.addAll(uncommons);
    randomCardSet.addAll(commons);

    notifyListeners();
  }

  void removeFromRandomCardSet(CardWubrg selectedCard) {
    if (randomCardSet.isNotEmpty) {
      randomCardSet.remove(selectedCard);
    }

    notifyListeners();
  }

  void addToUserCardSet(CardWubrg selectedCard) {
    userCardSet.add(selectedCard);
    notifyListeners();
  }

  void updateCarouselIndex(int index) {
    carouselIndex = index;
    print(carouselIndex);
    notifyListeners();
  }
}
