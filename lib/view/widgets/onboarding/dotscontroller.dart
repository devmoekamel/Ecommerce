
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Data/datasource/static/static.dart';
import '../../../controller/onboard_controller.dart';
import '../../../core/constant/appcolor.dart';

class Dotsonboarding extends StatelessWidget {
  const Dotsonboarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBaordControllerImp>(
      builder: (controller) =>Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
               ...List.generate(onboardlist.length  , (index) =>
       AnimatedContainer(
        margin: const EdgeInsets.only(right: 5,top: 20),
        duration:const Duration(milliseconds: 900),
        width: controller.currentpage==index?20.w:7.w,
        height: 7.h,
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:AppColor.primarycolor) ,
         ))
        ],
      ),
    );
  }
}