import 'dart:math';

import 'package:wubrg_app/services/database_service.dart';

import '../models/card_wubrg.dart';

// - Card Set Requiriments - //
// 1x Legend
// 1x Double Faced Battle
// 1x Single Faced U R M
// 1x Double Faced U R M
// 2x Uncommons
// 8x Commons
// 1x Land

CardWubrg getRandomCard(List<CardWubrg> cards) {
  final random = Random();
  var i = random.nextInt(cards.length);
  // print(i);
  return cards[i];
}

List<CardWubrg> getRandomCards(List<CardWubrg> cards, int quantity) {
  List<CardWubrg> randomCards = [];
  final random = Random();

  for (var i = 0; i < quantity; i++) {
    //This random value can be duplicated resulting in duplicated cards
    //Check if this can be possible
    var r = random.nextInt(cards.length);
    randomCards.add(cards[r]);
  }

  return randomCards;
}

Future<CardWubrg> getRandomLegendCard() async {
  List<CardWubrg> cards = await getLegendCards();
  print("Legends: ${cards.length}");
  return getRandomCard(cards);
}

Future<CardWubrg> getRandomDoubleFacedBattleCard() async {
  List<CardWubrg> cards = await getDoubleFacedBattleCards();
  print("DFB: ${cards.length}");
  return getRandomCard(cards);
}

Future<CardWubrg> getRandomSingleFacedCard() async {
  List<CardWubrg> cards = await getSingleFacedCards();
  print("SF: ${cards.length}");
  return getRandomCard(cards);
}

Future<CardWubrg> getRandomDoubleFacedCard() async {
  List<CardWubrg> cards = await getDoubleFacedCards();
  print("Double faced: ${cards.length}");
  return getRandomCard(cards);
}

Future<List<CardWubrg>> getRandomUncommonCard() async {
  List<CardWubrg> cards = await getUncommonCards();
  print("Uncommon: ${cards.length}");
  return getRandomCards(cards, 2);
}

Future<List<CardWubrg>> getRandomCommonCard() async {
  List<CardWubrg> cards = await getCommonCards();
  print("Common: ${cards.length}");
  return getRandomCards(cards, 8);
}
