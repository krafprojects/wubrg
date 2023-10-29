// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faceCard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaceCard _$FaceCardFromJson(Map<String, dynamic> json) => FaceCard(
      json['id'] as String,
      json['name'] as String,
      json['image_uri'] as String,
      json['type_line'] as String,
      json['oracle_text'] as String,
      json['flavor_text'] as String?,
      json['colors'] as String,
      json['mana_cost'] as String,
      json['power'] as String?,
      json['toughness'] as String?,
      json['defense'] as String?,
      json['loyalty'] as String?,
    );

Map<String, dynamic> _$FaceCardToJson(FaceCard instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_uri': instance.image_uri,
      'type_line': instance.type_line,
      'oracle_text': instance.oracle_text,
      'flavor_text': instance.flavor_text,
      'colors': instance.colors,
      'mana_cost': instance.mana_cost,
      'power': instance.power,
      'toughness': instance.toughness,
      'defense': instance.defense,
      'loyalty': instance.loyalty,
    };
