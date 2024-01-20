import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/app/home_controller.dart';
import '../../../core/constant/appcolor.dart';

class CustomOffersCard extends GetView<HomeControllerImp> {
  final String head ;
  final String body ;

 CustomOffersCard({
    super.key, required this.head, required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 170.h,
          decoration: BoxDecoration(
              color: AppColor.primarycolor,
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            title: Text(
            head  ,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            subtitle: Text(
             body ,
              style: TextStyle(color: Colors.white, fontSize: 29),
            ),
          ),
        ),
        // Positioned(
        //   top: -40,
        //   right: controller.lang=="en"?-40:null,
        //   left:  controller.lang=="ar"?-40:null,
        //   child: Container(
        //     height: 140,
        //     width: 140,
        //     decoration: BoxDecoration(
        //         color: Color.fromARGB(255, 145, 24, 3),
        //         borderRadius: BorderRadius.circular(160)),
        //   ),
        // )
      ]),
    );
  }
}
