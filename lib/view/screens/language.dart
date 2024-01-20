
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/constant/appcolor.dart';
import '../../core/constant/approute.dart';
import '../../core/localization/locale_controller.dart';
import '../widgets/language/custombuttonlang.dart';

class LanguagePage extends GetView<LocalController> {
  //  LocalController  local_Controller = Get.find();
  // const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Text(
            "1".tr,
            style: Theme.of(context).textTheme.displayLarge),
         SizedBox(height: 40.h,),
          CustomButtonLang(buttontext: "ar",onPressed: () {
              controller.changelocal("ar");
               Get.offAllNamed(AppRoute.onboard);

          },),
         SizedBox(height: 20.h,),
          CustomButtonLang(buttontext: "en",onPressed: () {
              controller.changelocal("en");
              Get.offAllNamed(AppRoute.onboard);
          },),

        ],
      ),
    );
  }
}

