
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/app/homescreen_controller.dart';
import '../../../core/constant/appcolor.dart';
import '../../../core/constant/approute.dart';
import '../../widgets/homescreen/custom_botnav.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        body: controller.pages[controller.currentpage],
        bottomNavigationBar: const BottomAppBar(
          height:60,
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          notchMargin: 15,
          child: CustomBotNav(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          // backgroundColor:App,
          // clipBehavior: ClipOval(),
          backgroundColor:AppColor.primarycolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

          onPressed: () {
            Get.toNamed(AppRoute.cartpage);
          },
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

