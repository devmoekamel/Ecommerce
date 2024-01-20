
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Data/models/items_model.dart';
import '../../../controller/app/home_controller.dart';
import '../../../core/functions/translate_database.dart';
import '../../../link_api.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150.h,
        child: ListView.builder(
            itemCount: controller.items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[index]))));
  }
}

// ignore: must_be_immutable
class ItemsHome extends StatelessWidget {
  ItemsModel itemsModel;
  ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          // color: AppColor.grey,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          // width: 150,
          // height: 100,
          child: Image.network(
            "${ApiLink.itemsimag}/${itemsModel.itemsImg}",
            fit: BoxFit.fill,
            height: 100.h,
            width: 150.w,
          ),
        ),
        Container(
          height: 120.h,
          width: 180.w,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25)),
        ),
        Positioned(
          bottom: -6,
          left: 5,
          child: Text(
            "${TranslateDB(itemsModel.itemsNameAr, itemsModel.itemsName)}",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              // fontSize: 17
            ),
          ),
        )
      ],
    );
  }
}
