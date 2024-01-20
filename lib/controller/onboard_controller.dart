
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Data/datasource/static/static.dart';
import '../core/constant/approute.dart';
import '../core/services/services.dart';

abstract class OnBaordController extends GetxController {
  next();

  onpagechanged(int index);
}

class OnBaordControllerImp extends OnBaordController {
  int currentpage = 0;
  late PageController pageController;
  
  @override
  next() {
    APPServices service = Get.find();
    currentpage++;
    if(currentpage > onboardlist.length-1)
    {
      service.pref.setString("onboard", "seen");
      
      Get.offAllNamed(AppRoute.login);
    }else{
  pageController.animateToPage(currentpage,
          duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
    }
   

    // update();
  }

  @override
  onpagechanged(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController = PageController();
  }
}
