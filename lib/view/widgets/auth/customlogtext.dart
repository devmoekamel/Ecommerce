import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

// ignore: must_be_immutable
class CustomTextforLogging extends StatelessWidget {
  String firsttext ;
  String secondtext ;
  void Function()? ontap ;
   CustomTextforLogging({
    super.key,
    required this.firsttext,
    required this.secondtext,
    required this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(firsttext,style:TextStyle(fontSize: 12),),
        InkWell(
          onTap: ontap ,
          child: Text(secondtext,style:const TextStyle(color:AppColor.primarycolor,fontWeight: FontWeight.bold,fontSize: 12),),)
      ],
    );
  }
}
