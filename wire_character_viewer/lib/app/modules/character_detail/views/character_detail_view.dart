import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/character_detail_controller.dart';

class CharacterDetailView extends GetResponsiveView<CharacterDetailController> {
  CharacterDetailView({Key? key}) : super(key: key);

  @override
  Widget phone() {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments['name']),
        centerTitle: true,
      ),
      body: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(
                    'https://duckduckgo.com${Get.arguments['imageUrl']}',
                    errorBuilder: (context, object, trace) {
                      return Image.network(
                          'https://static1.colliderimages.com/wordpress/wp-content/uploads/the-wire-title-logo-slice.jpg?q=50&fit=contain&w=1140&h=&dpr=1.5');
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Get.arguments['description'],
                        style: Get.textTheme.titleLarge,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
