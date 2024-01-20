import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/constant/imageasset.dart';


class LogoAuth extends StatelessWidget {
    // String title ;
  //  CustomTitleAuth({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Image.asset(AppImagAsset.applogo,height: 120,);
  }
}