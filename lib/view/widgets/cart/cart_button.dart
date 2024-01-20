
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboard_controller.dart';
import '../../../core/constant/appcolor.dart';

class CustomButtonCart extends GetView<OnBaordControllerImp> {

String text ;
  void Function()? onPressed;
   CustomButtonCart({
    super.key,
    required this.onPressed, 
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(bottom: 30),
      child:  MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        color: AppColor.primarycolor,
        textColor: Colors.white,
    
        onPressed:onPressed,child: Text(text), ),
    );
  }
}
