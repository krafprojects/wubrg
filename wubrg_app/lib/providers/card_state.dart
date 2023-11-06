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
  List<CardWubrg> randomCardSet = [];

  void generateRandomCardSet() async {
    CardWubrg legend = (await getRandomLegendCard()) as CardWubrg;
    CardWubrg doubleFBattle =
        (await getRandomDoubleFacedBattleCard()) as CardWubrg;
    CardWubrg singleFaced = (await getRandomSingleFacedCard()) as CardWubrg;
    CardWubrg doubleFaced = (await getRandomDoubleFacedCard()) as CardWubrg;
    List<CardWubrg> uncommons =
        (await getRandomUncommonCard()).cast<CardWubrg>();
    List<CardWubrg> commons = (await getRandomCommonCard()).cast<CardWubrg>();

    randomCardSet.add(legend);
    randomCardSet.add(doubleFBattle);
    randomCardSet.add(singleFaced);
    randomCardSet.add(doubleFaced);
    randomCardSet.addAll(uncommons);
    randomCardSet.addAll(commons);
  }
}
