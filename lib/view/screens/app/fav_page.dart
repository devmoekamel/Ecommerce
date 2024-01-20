
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controller/app/fav_controller.dart';
import '../../../core/class/handling_view.dart';
import '../../widgets/favourite/fav_list.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
      Get.put(FavoriteController());
    return  Scaffold(
      appBar: AppBar(title: Text("Favourite"),),
      body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GetBuilder<FavoriteController>(
                builder: (controller) => HandelingView(
                  statusResponse: controller.status,
                  widget: FavList())),
          ),
    );
  }
}
