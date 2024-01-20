import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controller/app/setting_controller.dart';
import '../../../core/constant/appcolor.dart';

class settingPage extends StatelessWidget {
  
  // const settingPage({super.key});

  @override
  Widget build(BuildContext context) {
  SettingController controller =   Get.put(SettingController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 2,
                decoration: BoxDecoration(color: AppColor.primarycolor),
              ),
              Positioned(
                top: Get.width / 2.7,
                child: Container(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      child: Image.asset("assets/images/avatar.png"),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 100,),
           Card(
            child: Column(children: [
              
              ListTile(
                title: Text("Change language"),
                trailing: Icon(Icons.language),),
              ListTile(
                onTap: () => controller.gotoaddress(),
                title: Text("Address"),
                trailing: Icon(Icons.place),),
              ListTile(
                title: Text("Contact Us"),
                trailing: Icon(Icons.call),),
              ListTile(
                title: Text("About us"),
                trailing: Icon(Icons.info_outline_rounded)),
               ListTile(
                onTap:()=>controller.logout(),
                title: Text("Logout"),
                trailing: Icon(Icons.exit_to_app_sharp)),
              
            ]),
          )
                  ],
      ),
    );
  }
}
