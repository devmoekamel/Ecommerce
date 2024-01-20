
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/app/productdetails_controller.dart';
import '../../../core/constant/appcolor.dart';

class TitleWidget extends GetView<ProductDetailControllerImp> {
  
  
   TitleWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          controller.itemsModel.itemsName!,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.thirdcolor),
        ));
  }
}
