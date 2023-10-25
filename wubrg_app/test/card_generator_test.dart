import 'dart:math';
import 'package:flutter_test/flutter_test.dart';

class Card {
  final String name;

  Card(this.name);
}

class CardGenerator {
  static final List<String> multiverseLegends = [
    'Multiverse Legend 1',
    'Multiverse Legend 2',
    'Multiverse Legend 3',
  ];

  static final List<String> doubleFacedBattle = [
    'Double-Faced Battle 1',
    'Double-Faced Battle 2',
    'Double-Faced Battle 3',
  ];

  static final List<String> singleFaced = [
    'Single-Faced 1',
    'Single-Faced 2',
    'Single-Faced 3',
  ];

  static final List<String> doubleFaced = [
    'Double-Faced 1',
    'Double-Faced 2',
    'Double-Faced 3',
  ];

  static final List<String> uncommons = [
    'Uncommon 1',
    'Uncommon 2',
    'Uncommon 3',
  ];

  static final List<String> commons = [
    'Common 1',
    'Common 2',
    'Common 3',
    'Common 4',
    'Common 5',
  ];

  static final List<String> lands = [
    'Basic Land 1',
    'Basic Land 2',
    'Basic Land 3',
    'Dual Land 1',
    'Dual Land 2',
  ];

  static List<String> generateCards() {
    final random = Random();
    final cards = <String>[];

    cards.add(multiverseLegends[random.nextInt(multiverseLegends.length)]);
    cards.add(doubleFacedBattle[random.nextInt(doubleFacedBattle.length)]);
    cards.add(singleFaced[random.nextInt(singleFaced.length)]);
    cards.add(doubleFaced[random.nextInt(doubleFaced.length)]);

    for (var i = 0; i < 2; i++) {
      cards.add(uncommons[random.nextInt(uncommons.length)]);
    }

    for (var i = 0; i < 8; i++) {
      cards.add(commons[random.nextInt(commons.length)]);
    }

    cards.add(lands[random.nextInt(lands.length)]);

    return cards;
  }
}

void main() {
  test('Generate 15 random cards', () {
    final cards = CardGenerator.generateCards();
    expect(cards.length, equals(15));
  });
}