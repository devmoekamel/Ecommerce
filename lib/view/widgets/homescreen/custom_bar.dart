import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/app/homescreen_controller.dart';
import '../../../core/constant/appcolor.dart';

class Bar extends GetView<HomeScreenControllerImp> {
  final int currentpage;
  final bool active;
  final IconData icon;
  Bar(
      {super.key,
      required this.currentpage,
      required this.active,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: active ? AppColor.primarycolor : AppColor.grey2,
      icon: Icon(icon),
      // tooltip: "Home", // Accessibility for screen readers
      onPressed: () => controller.changepage(currentpage),
    );
  }
}
