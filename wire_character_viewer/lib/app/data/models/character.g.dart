// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      firstUrl: json['FirstURL'] as String,
      icon: CharacterIcon.fromJson(json['Icon'] as Map<String, dynamic>),
      description: json['Text'] as String,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'FirstURL': instance.firstUrl,
      'Icon': instance.icon,
      'Text': instance.description,
    };
