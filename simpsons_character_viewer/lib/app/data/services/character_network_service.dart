import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/character.dart';

const String charactersURL = "http://api.duckduckgo.com/?q=simpsons+characters&format=json";

class CharacterNetworkService {
  Future<List<Character>> fetchCharacters() async {
    http.Response response = await http.get(Uri.parse(charactersURL));
    if (response.statusCode == 200) {
      Map characterData = jsonDecode(response.body);
      List<dynamic> characters = characterData["RelatedTopics"];
      return characters.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception("Something went wrong, ${response.statusCode}");
    }
  }
}