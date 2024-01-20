import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Data/models/items_model.dart';
import '../../../controller/app/fav_controller.dart';
import '../../../controller/app/items_controller.dart';
import '../../../core/constant/appcolor.dart';
import '../../../core/functions/translate_database.dart';
import '../../../link_api.dart';

class CustomItemsList extends GetView<ItemsControllerImp> {
  FavoriteController favcon = Get.find();
  CustomItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.6),
        itemBuilder: (context, i) {
          favcon.fav[controller.items[i]['items_id']] =
              controller.items[i]['favourite'];
          return ItemCard(itemsModel: ItemsModel.fromJson(controller.items[i]));
        });
  }
}

class ItemCard extends GetView<ItemsControllerImp> {
  FavoriteController favcon = Get.find();
  ItemCard({
    super.key,
    required this.itemsModel,
  });

  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => controller.gottoproduct_detail(itemsModel),
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                // transitionOnUserGestures: true,
                tag: "${itemsModel.itemsId}",
                child: Image.network(
                  "${ApiLink.itemsimag}/${itemsModel.itemsImg}",
                  height: 100.h,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                "${TranslateDB(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Text(
              //   "${itemsModel.itemsDesc}",
              //   textAlign: TextAlign.center,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${itemsModel.finalprice.toString()} \$",
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      fontSize: 18.sp,
                      color: AppColor.primarycolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GetBuilder<FavoriteController>(
                    builder: (controller) => IconButton(
                      onPressed: () {
                        if (favcon.fav[itemsModel.itemsId] == 1) {
                          favcon.removetofav(itemsModel.itemsId.toString());
                          favcon.setvalue(itemsModel.itemsId, 0);
                        } else {
                          favcon.addtofav(itemsModel.itemsId.toString());
                          favcon.setvalue(itemsModel.itemsId, 1);
                        }
                      },
                      icon: favcon.fav[itemsModel.itemsId] == 1
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border_outlined),
                      color: AppColor.primarycolor,
                    ),
                  )
                ],
              )
            ],
          ),
        )));
  }
}
