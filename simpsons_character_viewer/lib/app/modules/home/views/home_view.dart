import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simpsons_character_viewer/app/data/services/character_network_service.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetResponsiveView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final CharacterNetworkService characterNetworkService =
      CharacterNetworkService();

  @override
  Widget? phone() {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                  Expanded(
                    child: SearchBar(
                      onChanged: (value) {
                        controller.doSearch(value);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Obx(() => controller.characters.value.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.characters.value.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/character-detail', arguments: {
                        'name': controller.getCharacterName(
                            controller.characters.value[index].firstUrl),
                        'description':
                            controller.characters.value[index].description,
                        'imageUrl':
                            controller.characters.value[index].icon.url!,
                      });
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(controller.getCharacterName(
                            controller.characters.value[index].firstUrl)),
                      ),
                    ),
                  );
                },
              )));
  }

  @override
  Widget? tablet() {
    return Scaffold(
        appBar: AppBar(
          title: SizedBox(
            width: Get.width / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                Expanded(
                  child: SearchBar(
                    onChanged: (value) {
                      controller.doSearch(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.characters.value.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width / 2,
                      height: Get.height,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.characters.value.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.selectedCharacterIndex.value = index;
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(controller.getCharacterName(
                                    controller
                                        .characters.value[index].firstUrl)),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: Get.width / 2,
                      height: Get.height,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.getCharacterName(controller
                                    .characters
                                    .value[
                                        controller.selectedCharacterIndex.value]
                                    .firstUrl),
                                style: Get.textTheme.headlineLarge,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  'https://duckduckgo.com${controller.characters.value[controller.selectedCharacterIndex.value].icon.url!}',
                                  errorBuilder: (context, object, trace) {
                                    return Image.network(
                                        'https://www.clipartmax.com/png/small/64-642139_transparent-doughnut-simpsons-donut-png.png');
                                  },
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller
                                    .characters
                                    .value[
                                        controller.selectedCharacterIndex.value]
                                    .description,
                                style: Get.textTheme.titleLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ));
  }
}
