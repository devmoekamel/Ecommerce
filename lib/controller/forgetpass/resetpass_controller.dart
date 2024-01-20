
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Data/datasource/remote/forgetpass/resetpass_service.dart';
import '../../core/class/status_response.dart';
import '../../core/constant/approute.dart';
import '../../core/functions/handle_res.dart';

abstract class ResetPasscontroller extends GetxController {
  changepass();
  // gotosResetPass();
}

class ResetPasscontrollerImp extends ResetPasscontroller {
// text controllers
  late TextEditingController Password;
  late TextEditingController rePassword;
  GlobalKey<FormState> formkey = GlobalKey();

// api
  late String email;
  ResetPassService service = ResetPassService(Get.find());
  StatusResponse status = StatusResponse.initial;

  @override
  void onInit() {
    email = Get.arguments['email'];
    Password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    Password.dispose();
    rePassword.dispose();
    super.dispose();
  }

  @override
  changepass() async {
    if (formkey.currentState!.validate()) {
      if (Password.text == rePassword.text) {
        status = StatusResponse.loading;
        update();
        var res = await service.resetpass_request(
            email: email, password: Password.text);
        status = handle_Res(res);
        if (status == StatusResponse.success) {
          if (res["status"] == "success") {
            status = StatusResponse.success;
            Get.offNamed(AppRoute.successresetpass);
          } else {
            status = StatusResponse.failure;
            Get.defaultDialog(
                title: "Warning", middleText: "somthing went wrong  Try again");
          }
        }
      } else {
        Get.defaultDialog(
            title: "Attention", middleText: "Passwords not matching");
      }
    }
    update();
  }

  // @override
}
