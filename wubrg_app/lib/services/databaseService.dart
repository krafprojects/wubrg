import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/card.dart';

void main() {
  getLegendCards();
}

const _supabaseKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlpbHdvaXZuamJ5cGV0a2ZzeXlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY0NTI0NTUsImV4cCI6MjAxMjAyODQ1NX0.3zWKrWYXRDAQ6s1QB3c7wcymA642SQSJluxGXFC4C_8";
const _supabaseUrl = "https://yilwoivnjbypetkfsyyo.supabase.co";

final supabase = SupabaseClient(_supabaseUrl, _supabaseKey);

List<Card> generateCardsList(List<Map<String, dynamic>> response) {
  List<Card> cards = [];
  if (response.isNotEmpty) {
    for (var card in response) {
      cards.add(Card.fromJson(card));
    }
  } else {
    print("Response from database is empty.");
  }
  return cards;
}

Future<List<Card>> getLegendCards() async {
  List<Card> cards = [];
  try {
    List<Map<String, dynamic>> response = await supabase
        .from("cards")
        .select<PostgrestList>("*, face_front(*), face_reverse(*)")
        .eq("card_set", "mul");

    cards = generateCardsList(response);
  } on Exception catch (e) {
    print("Error");
  }
  return cards;
}

Future<List<Card>> getCommonCards() async {
  List<Card> cards = [];
  try {
    List<Map<String, dynamic>> response = await supabase
        .from("cards")
        .select<PostgrestList>("*, face_front(*), face_reverse(*)")
        .neq("double_faced", "true")
        .neq("double_faced_battle", "true");

    cards = generateCardsList(response);
  } on Exception catch (e) {
    print("Error");
  }
  return cards;
}

Future<List<Card>> getDoubleFacedCards() async {
  List<Card> cards = [];
  try {
    List<Map<String, dynamic>> response = await supabase
        .from("cards")
        .select<PostgrestList>("*, face_front(*), face_reverse(*)")
        .eq("double_faced", "true")
        .neq("double_faced_battle", "true");

    cards = generateCardsList(response);
  } on Exception catch (e) {
    print("Error");
  }
  return cards;
}

Future<List<Card>> getDoubleFacedBattleCards() async {
  List<Card> cards = [];
  try {
    List<Map<String, dynamic>> response = await supabase
        .from("cards")
        .select<PostgrestList>("*, face_front(*), face_reverse(*)")
        .eq("double_faced", "true")
        .eq("double_faced_battle", "true");

    cards = generateCardsList(response);
  } on Exception catch (e) {
    print("Error");
  }
  return cards;
}
