
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboard_controller.dart';
import '../../../core/constant/appcolor.dart';

class CustomButton extends GetView<OnBaordControllerImp> {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child:  MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100,vertical:10),
        color: AppColor.primarycolor,
        textColor: Colors.white,
    
        onPressed:() {
          controller.next();
        },child: Text("8".tr), ),
    );
  }
}
