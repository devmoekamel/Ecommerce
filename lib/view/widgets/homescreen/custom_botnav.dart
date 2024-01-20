import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/app/homescreen_controller.dart';
import 'custom_bar.dart';

class CustomBotNav extends StatelessWidget {
  const CustomBotNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(controller.pages.length + 1, (index) {
            int i = index > 2 ? index - 1 : index;
            return index == 2
                ?  SizedBox(
                    width: 55.w,
                  )
                : Bar(
                    currentpage: i,
                    active: controller.currentpage == i ? true : false,
                    icon: controller.icons[i]);
          })
        ],
      ),
    );
  }
}
