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
    int selectedIndex = 0;

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                Obx(() => controller.characters.value.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: controller.characters.value.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              selectedIndex = index;
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(controller.getCharacterName(
                                    controller.characters.value[index].firstUrl)),
                              ),
                            ),
                          );
                        },
                      ))
              ],
            ),
          ),
          Expanded(
            child: Column(children: [
              Obx(() => controller.characters.value.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://duckduckgo.com${controller.characters.value[selectedIndex].icon.url!}',
                                errorBuilder: (context, object, trace) {
                                  return Image.network(
                                      'https://www.clipartmax.com/png/small/64-642139_transparent-doughnut-simpsons-donut-png.png');
                                },
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                              controller.characters.value[selectedIndex].description,
                              style: Get.textTheme.titleLarge,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
            ]),
          )
        ],
      ),
    );
  }
}
