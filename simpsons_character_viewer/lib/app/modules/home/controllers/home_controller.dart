import 'package:get/get.dart';

import '../../../data/models/character.dart';
import '../../../data/services/character_network_service.dart';

class HomeController extends GetxController {
  Rx<List<Character>> characters = Rx<List<Character>>([]);
  Rx<int> selectedCharacterIndex = Rx<int>(0);

  @override
  Future<void> onInit() async {
    CharacterNetworkService characterNetworkService = CharacterNetworkService();
    characters.value = await characterNetworkService.fetchCharacters();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void doSearch(String searchString) async {
    CharacterNetworkService characterNetworkService = CharacterNetworkService();
    if (searchString.isEmpty) {
      characters.value = await characterNetworkService.fetchCharacters();
    } else {
      characters.value = characters.value
          .where((element) =>
              element.firstUrl
                  .toLowerCase()
                  .contains(searchString.toLowerCase()) ||
              element.description
                  .toLowerCase()
                  .contains(searchString.toLowerCase()))
          .toList();
    }
  }

  String getCharacterName(String firstUrl) {
    return firstUrl
        .substring(firstUrl.lastIndexOf('/') + 1)
        .replaceAll('_', ' ');
  }
}
