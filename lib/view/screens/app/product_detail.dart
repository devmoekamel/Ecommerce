
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/app/productdetails_controller.dart';
import '../../../core/constant/appcolor.dart';
import '../../widgets/product_detail/desc_widget.dart';
import '../../widgets/product_detail/img_widget.dart';
import '../../widgets/product_detail/price_widget.dart';
import '../../widgets/product_detail/title_widget.dart';

class ProductDetail extends StatelessWidget {

  // CartController  cartController = Get.put(CartController());
   ProductDetailControllerImp con = Get.put(ProductDetailControllerImp());
   ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        bottomNavigationBar: Container(
            // margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(25),
                color: AppColor.thirdcolor),
            height: 60.h,
            alignment: Alignment.center,
            child: Text(
              "ADD To Cart",
              style: TextStyle(color: Colors.white),
            )),
        body: Container(
          child: ListView(
            children: [
              ProductImg(),
               SizedBox(
                height: 70.h,
              ),
              TitleWidget(),
               SizedBox(
                height: 10.h,
              ),
              PriceWidget(),
               SizedBox(
                height: 10.h,
              ),
              ProuctDesc(),
            SizedBox(
                height: 20.h,
              ),
              // TitleWidget(
               
              //   text: "Color",
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // ColorWidget(),
              // const SizedBox(
              //   height: 20,
              // )
            ],
          ),
        ));
  }
}
