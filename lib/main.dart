
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommrecemvc/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/TranslationLocale.dart';
import 'core/localization/locale_controller.dart';
import 'core/services/services.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initservices();
  runApp( ECommerce());
}

class ECommerce extends StatelessWidget {
  // const ECommerce({super.key});
    LocalController con =  Get.put(LocalController());


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    builder: (context, child) => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: TranslationLocale(),
      locale: con.lang,
      // home: test(),
      getPages: routes,
      theme: con.apptheme

    )
    
    );
  }
}