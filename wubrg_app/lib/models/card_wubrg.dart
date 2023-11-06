import 'package:json_annotation/json_annotation.dart';

import 'faceCard.dart';

part 'card_wubrg.g.dart';

@JsonSerializable()
class CardWubrg {
  String id;
  String name;
  String card_set;
  bool double_faced;
  bool double_faced_battle;
  String rarity;
  FaceCard face_front;
  FaceCard? face_reverse;

  CardWubrg(
      this.id,
      this.name,
      this.card_set,
      this.double_faced,
      this.double_faced_battle,
      this.rarity,
      this.face_front,
      this.face_reverse);

  factory CardWubrg.fromJson(Map<String, dynamic> jsonData) =>
      _$CardFromJson(jsonData);

  Map<String, dynamic> toJson() => _$CardToJson(this);
}
