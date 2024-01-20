
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/app/productdetails_controller.dart';
import '../../../core/constant/appcolor.dart';

class PriceWidget extends GetView<ProductDetailControllerImp> {
  // CartController cartController = Get.find();

  const PriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Text(
            "${controller.itemsModel.finalprice} \$",
            style: TextStyle(fontSize: 25.sp, color: AppColor.primarycolor),
          ),
          Spacer(),
          Row(
            children: [
              IconButton(
                  onPressed: () => controller
                      .removetocart(controller.itemsModel.itemsId.toString()),
                  icon: Icon(Icons.remove_circle)),
              GetBuilder<ProductDetailControllerImp>(
                builder: (controller) => Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Text(controller.count.toString())),
              ),
              IconButton(
                  onPressed: () => controller
                      .addtoCart(controller.itemsModel.itemsId.toString()),
                  icon: Icon(Icons.add_circle_rounded))
            ],
          ),
        ],
      ),
    );
  }
}
