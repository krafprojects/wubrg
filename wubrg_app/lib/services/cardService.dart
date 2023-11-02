import 'dart:math';

import 'package:wubrg_app/services/databaseService.dart';

import '../models/card.dart';

// - Card Set Requiriments - //
// 1x Legend
// 1x Double Faced Battle
// 1x Single Faced U R M
// 1x Double Faced U R M
// 2x Uncommons
// 8x Commons
// 1x Land

Card getRandomCard(List<Card> cards) {
  final random = Random();
  var i = random.nextInt(cards.length);
  print(i);
  return cards[i];
}

List<Card> getRandomCards(List<Card> cards, int quantity) {
  List<Card> randomCards = [];
  final random = Random();

  for (var i = 0; i < quantity; i++) {
    //This random value can be duplicated resulting in duplicated cards
    //Check if this can be possible
    var r = random.nextInt(cards.length);
    randomCards.add(cards[r]);
  }

  return randomCards;
}

Future<Card> getRandomLegendCard() async {
  List<Card> cards = await getLegendCards();
  print(cards.length);
  return getRandomCard(cards);
}

Future<Card> getRandomDoubleFacedBattleCard() async {
  List<Card> cards = await getDoubleFacedBattleCards();
  print(cards.length);
  return getRandomCard(cards);
}

Future<Card> getRandomSingleFacedCard() async {
  List<Card> cards = await getSingleFacedCards();
  print(cards.length);
  return getRandomCard(cards);
}

Future<Card> getRandomDoubleFacedCard() async {
  List<Card> cards = await getDoubleFacedCards();
  print(cards.length);
  return getRandomCard(cards);
}

Future<List<Card>> getRandomUncommonCard() async {
  List<Card> cards = await getUncommonCards();
  print(cards.length);
  return getRandomCards(cards, 2);
}

Future<List<Card>> getRandomCommonCard() async {
  List<Card> cards = await getCommonCards();
  print(cards.length);
  return getRandomCards(cards, 8);
}
