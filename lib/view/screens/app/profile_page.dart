import 'package:ecommrecemvc/controller/app/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfileController controller = Get.put(ProfileController());
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Card(
              child: Column(children: [
                ListTile(
                  title: Text("${controller.username}"),
                  leading:Icon(Icons.person) ,
                ),
                ListTile(
                  title:Text("${controller.email}") ,
                  leading:Icon(Icons.email) ,
                  // leading: Text("${controller.email}"),
                ),
               ListTile(
                  title:Text("${controller.phone}") ,
                  leading:Icon(Icons.phone_android) ,
                  // leading: Text("${controller.email}"),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
