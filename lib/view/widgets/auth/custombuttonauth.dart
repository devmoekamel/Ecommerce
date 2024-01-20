import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/appcolor.dart';

// ignore: must_be_immutable
class CustomButtonAuth extends StatelessWidget {
  String  buttontext ;
  void Function()? onPressed ;
   CustomButtonAuth({
    super.key,
    required this.buttontext,
     this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 50.h,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
        color: AppColor.primarycolor,
        borderRadius: BorderRadius.circular(25)
        ),
        child: Text(buttontext,style:const TextStyle(color:Colors.white),),
        // child: MaterialButton(
        // color: AppColor.primarycolor,
      
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        //   onPressed: onPressed,
        //   child: Text(buttontext),
        //   textColor: Colors.white,
        // ),
      ),
    );
  }
}