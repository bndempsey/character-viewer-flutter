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
                Image.network(
                    'https://duckduckgo.com${Get.arguments['imageUrl']}',
                  errorBuilder:  (context, object, trace) {
                      return Image.network('https://www.clipartmax.com/png/small/64-642139_transparent-doughnut-simpsons-donut-png.png');
                  },
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(Get.arguments['description'], style: Get.textTheme.titleLarge,),
                )),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
