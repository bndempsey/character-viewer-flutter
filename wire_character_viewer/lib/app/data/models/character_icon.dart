
import 'package:json_annotation/json_annotation.dart';

part 'character_icon.g.dart';

@JsonSerializable()
class CharacterIcon {
  @JsonKey(name: 'URL')
  final String? url;

  CharacterIcon({
    this.url,
  });

  factory CharacterIcon.fromJson(Map<String, dynamic> json) =>
    _$CharacterIconFromJson(json);
}