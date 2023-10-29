import 'package:json_annotation/json_annotation.dart';

part 'faceCard.g.dart';

@JsonSerializable()
class FaceCard {
  String id;
  String name;
  String image_uri;
  String type_line;
  String oracle_text;
  String? flavor_text;
  String colors;
  String mana_cost;
  String? power;
  String? toughness;
  String? defense;
  String? loyalty;

  FaceCard(
      this.id,
      this.name,
      this.image_uri,
      this.type_line,
      this.oracle_text,
      this.flavor_text,
      this.colors,
      this.mana_cost,
      this.power,
      this.toughness,
      this.defense,
      this.loyalty);

  factory FaceCard.fromJson(Map<String, dynamic> jsonData) =>
      _$FaceCardFromJson(jsonData);

  Map<String, dynamic> toJson() => _$FaceCardToJson(this);
}
