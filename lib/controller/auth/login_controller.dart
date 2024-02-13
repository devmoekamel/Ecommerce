
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Data/datasource/remote/Auth/login_service.dart';
import '../../core/class/status_response.dart';
import '../../core/constant/approute.dart';
import '../../core/functions/handle_res.dart';
import '../../core/services/services.dart';

abstract class LoginController   extends GetxController{
  // ignore: non_constant_identifier_names
  Login();
  gotosignup();
  gotoforgetpassword();
}


class LoginControllerImp  extends LoginController {

// text controllers
 late TextEditingController email  ;
 late TextEditingController password  ;
// form key
bool showpass =true;
GlobalKey<FormState> formkey =GlobalKey();

// api 
StatusResponse status = StatusResponse.initial ;
LoginService service = LoginService(Get.find());

// shared service
APPServices  appServices = Get.find();


@override
Login()async {
    if(formkey.currentState!.validate()){
          status = StatusResponse.loading;
          update();
     var res = await service.Login_request(email: email.text, password: password.text);
    //  print(res);
        status = handle_Res(res);
        if(status==StatusResponse.success){
          if(res["status"]=="success")
          {
              // print(res["data"][0]["users_id"]);
            appServices.pref.setString("logged","yes");
            appServices.pref.setString("userid",res["data"][0]["users_id"].toString());
            appServices.pref.setString("username",res["data"][0]["users_name"].toString());
            appServices.pref.setString("email",res["data"][0]["users_email"].toString());
             appServices.pref.setString("phone",res["data"][0]["users_phone"].toString());
            Get.offAllNamed(AppRoute.home);
          }
          else{
            Get.defaultDialog(
              title: "warning", middleText: "wrong Email or password ");
          status = StatusResponse.failure;
          }
        }
        update();
    }

  }

  @override
  gotosignup() {
    Get.offNamed(AppRoute.signup);
    
  }

  @override
  gotoforgetpassword() {
  Get.offNamed(AppRoute.forgetpassword);
  }
@override
  void onInit() {
   
    email  =TextEditingController();
    password  = TextEditingController();
    // print(showpass);
   
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  
  showpassword(){
    showpass = !showpass ;
    update();
  }

}