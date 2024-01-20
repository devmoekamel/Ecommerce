
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/apptheme.dart';
import '../services/services.dart';

class LocalController extends GetxController {
  APPServices service = Get.find();
  ThemeData apptheme = englishthem ;
  Locale? lang;

  changelocal(String lang) async {
    await service.pref.setString("lang", lang);
    apptheme =  lang=="ar"?arabictheme:englishthem;
    Get.changeTheme(apptheme);
    Get.updateLocale(Locale(lang));
  }

  @override
  void onInit() {
    super.onInit();
    if (service.pref.getString("lang") == "ar") {
      lang = Locale("ar");
      apptheme = arabictheme ;
    } else if (service.pref.getString("lang") == "en") {
      lang = Locale("en");
      apptheme = englishthem ;
    } else {
      lang = Get.deviceLocale;
      apptheme = englishthem ;
    }
  }
}
