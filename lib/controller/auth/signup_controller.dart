
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Data/datasource/remote/Auth/signup_service.dart';
import '../../core/class/status_response.dart';
import '../../core/constant/approute.dart';
import '../../core/functions/handle_res.dart';

abstract class SingupController extends GetxController {
  signup();
  // gotoCheckEmail();
}

class SignupControllerImp extends SingupController {
// text controllers
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController username;
  bool showpass = true;
// validation key
  GlobalKey<FormState> formkey = GlobalKey();

//sign up service
  SignUPService signservice = SignUPService(Get.find());
  StatusResponse status = StatusResponse.initial;
   
  @override
  signup() async {
    if (formkey.currentState!.validate()) {
      status = StatusResponse.loading;
      update();
      var response = await signservice.Signup_request(
          email: email.text,
          username: username.text,
          phone: phone.text,
          password: password.text);
          print(response);
      status = handle_Res(response);
      if (status == StatusResponse.success) {
        if (response["status"] == "success") {
      
              
          Get.offNamed(AppRoute.verifycodesign,arguments:{
            "email":email.text
          } );
        } else {
          Get.defaultDialog(
              title: "warning", middleText: "Email or phone already exist");
          status = StatusResponse.failure;
        }
      }
      update();
    }
  }

  // @override
  // gotoCheckEmail() {
  //   // Get.back();
  //   Get.offNamed(AppRoute.checkemail);
  // }
  showpassword() {
    showpass = !showpass;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
