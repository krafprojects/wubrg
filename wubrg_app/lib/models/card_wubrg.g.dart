// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_wubrg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardWubrg _$CardFromJson(Map<String, dynamic> json) => CardWubrg(
      json['id'] as String,
      json['name'] as String,
      json['card_set'] as String,
      json['double_faced'] as bool,
      json['double_faced_battle'] as bool,
      json['rarity'] as String,
      FaceCard.fromJson(json['face_front'] as Map<String, dynamic>),
      json['face_reverse'] == null
          ? null
          : FaceCard.fromJson(json['face_reverse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CardToJson(CardWubrg instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'card_set': instance.card_set,
      'double_faced': instance.double_faced,
      'double_faced_battle': instance.double_faced_battle,
      'rarity': instance.rarity,
      'face_front': instance.face_front,
      'face_reverse': instance.face_reverse,
    };
