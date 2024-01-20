
import 'package:ecommrecemvc/view/screens/app/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screens/app/home.dart';
import '../../view/screens/app/setting_page.dart';

abstract class HomeScreenController extends GetxController {
  changepage(int current);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> pages = [
   const Home(),
    const  Column(
        children: [Center(child: Text("page3"))],
      ),
    
   ProfilePage(),
   settingPage(),
  ];

  List<IconData> icons = [
    Icons.home,
    Icons.favorite,
    Icons.person,
    Icons.settings,
  ];

  @override
  changepage(int current) {
    currentpage = current;
    update();
  }
}
