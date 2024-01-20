import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/app/productdetails_controller.dart';
import '../../../link_api.dart';

class ProductImg extends GetView<ProductDetailControllerImp> {
  const ProductImg({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 200.h,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 215, 54, 25),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              )),
        ),
        Positioned(
          top: 30,
          left: Get.width / 8,
          right: Get.width / 8,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: Image.network(
                height: 250.h,
                // fit: BoxFit.fitHeigh,

                "${ApiLink.itemsimag}/${controller.itemsModel.itemsImg}"),
          ),
        ),
      ],
    );
  }
}
