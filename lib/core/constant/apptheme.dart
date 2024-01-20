import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'appcolor.dart';

ThemeData englishthem = ThemeData(
    fontFamily: "PlayfairDisplay",
    // appBarTheme: const AppBarTheme(
        
    //     iconTheme: IconThemeData(color: Colors.white),
    //     color: AppColor.primarycolor,
    //     titleTextStyle: TextStyle(
    //       color: Colors.white,
    //       fontSize: 20,
    //       fontWeight: FontWeight.bold,
    //     )),
    textTheme:  TextTheme(
        displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
        displayMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        bodyMedium: TextStyle(
            height: 2, color: Color.fromARGB(255, 104, 103, 103), fontSize: 15),
        bodySmall: TextStyle(
            height: 2,
            color: Color.fromARGB(255, 104, 103, 103),
            fontSize: 13)));

ThemeData arabictheme = ThemeData(
    fontFamily: "Cairo",
    // appBarTheme: const AppBarTheme(
    //     iconTheme: IconThemeData(color: Colors.white),
    //     color: AppColor.primarycolor,
    //     titleTextStyle: TextStyle(
    //       color: Colors.white,
    //       fontSize: 20,
    //       fontWeight: FontWeight.bold,
    //     )),
    textTheme:  TextTheme(
        displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
        displayMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        bodyMedium: TextStyle(
            height: 2, color: Color.fromARGB(255, 104, 103, 103), fontSize: 15),
        bodySmall: TextStyle(
            height: 2,
            color: Color.fromARGB(255, 104, 103, 103),
            fontSize: 13)));
