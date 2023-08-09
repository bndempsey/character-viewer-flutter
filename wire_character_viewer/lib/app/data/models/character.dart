import 'package:json_annotation/json_annotation.dart';
import 'character_icon.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  @JsonKey(name: 'FirstURL')
  final String firstUrl;
  @JsonKey(name: 'Icon')
  final CharacterIcon icon;
  @JsonKey(name: 'Text')
  final String description;

  Character({
    required this.firstUrl,
    required this.icon,
    required this.description,
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
