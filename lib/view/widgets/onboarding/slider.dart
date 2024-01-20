
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Data/datasource/static/static.dart';
import '../../../controller/onboard_controller.dart';

class SliderOnBoarding extends GetView<OnBaordControllerImp> {
  

  const SliderOnBoarding({super.key});
      
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // clipBehavior:,
        controller: controller.pageController,
            onPageChanged: (value) {
              controller.onpagechanged(value);
            },
              itemCount: onboardlist.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
  
                    Image.asset(onboardlist[i].img.toString()),
                     SizedBox(
                      height: 40.h,
                    ),
                     Text(
                      onboardlist[i].title.toString(),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                      SizedBox(
                      height: 10.h,
                    ),
                    Container(
                        // width: double.infinity,d
                        alignment: Alignment.center,
                        child: Text(onboardlist[i].body.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium))
                  ],
                );
              },
            );
  }
}