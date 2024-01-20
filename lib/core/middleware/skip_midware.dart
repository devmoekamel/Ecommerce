
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/approute.dart';
import '../services/services.dart';

class SkipMidWare extends GetMiddleware{

 @override
  int? priority = 1;

  APPServices service = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if(service.pref.getString("onboard")=="seen")
    {
      return RouteSettings(name: AppRoute.login);
    }

  }

}