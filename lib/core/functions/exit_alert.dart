import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
 exitalert(){

Get.defaultDialog(
  title: "Warning",
  middleText: "Do you want to Quit app ?",
  actions: [
    ElevatedButton(onPressed:() =>exit(0) , child: Text("confirm")),
    ElevatedButton(onPressed: () =>Get.back() , child:Text("cancel"))
    ]
);

}


