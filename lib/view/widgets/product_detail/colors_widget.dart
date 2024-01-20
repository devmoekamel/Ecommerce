
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/app/productdetails_controller.dart';
import '../../../core/constant/appcolor.dart';

class ColorWidget extends GetView<ProductDetailControllerImp> {
  const ColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
                children: [
                  ...List.generate(
                      controller.found.length,
                      (index) => Container(
                            margin:  EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            height: 60.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.thirdcolor),
                                borderRadius: BorderRadius.circular(10),
                                color: controller.found[index]["active"] == 1
                                    ? AppColor.thirdcolor
                                    : Colors.white),
                            child: Text(
                              controller.found[index]["name"],
                              style: TextStyle(
                                  color: controller.found[index]["active"] == 1
                                      ? Colors.white
                                      : AppColor.thirdcolor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))

                 
                ],
              );
  }
}