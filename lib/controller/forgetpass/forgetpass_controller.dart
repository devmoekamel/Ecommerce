
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Data/datasource/remote/forgetpass/checkmail_service.dart';
import '../../core/class/status_response.dart';
import '../../core/constant/approute.dart';
import '../../core/functions/handle_res.dart';

abstract class ForgetPasscontroller   extends GetxController{
  checkEmail();
}


class ForgetPasscontrollerImp  extends ForgetPasscontroller {

// text controllers
late TextEditingController email  ;
GlobalKey<FormState> formkey =GlobalKey();

// api
StatusResponse status = StatusResponse.initial;
CheckEmailService service  = CheckEmailService(Get.find());

@override
  void onInit() {
    email  =TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
  
  @override
  checkEmail() async{
  if(formkey.currentState!.validate()){
    status = StatusResponse.loading;
    update();
    var res = await service.checkemail_request(email: email.text);

    status = handle_Res(res);

    if(status == StatusResponse.success)
    {
      if(res["status"]=="success")
      {
        status = StatusResponse.success ;
          Get.offNamed(AppRoute.verifycode,arguments: {
            "email":email.text
          });
      }else{
        status = StatusResponse.failure ;
        Get.defaultDialog(title: "Warning",middleText:"Email donesn't exist" );
      }
    }
  }
  update();
  }
  

  


  

 }