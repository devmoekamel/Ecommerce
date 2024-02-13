
import 'package:get/get.dart';

import '../../Data/datasource/remote/Auth/verifysign_service.dart';
import '../../core/class/status_response.dart';
import '../../core/constant/approute.dart';
import '../../core/functions/handle_res.dart';

abstract class VerifyCodeSignController   extends GetxController{
  checkCode(String code);
}


class VerifyCodeSignControllerImp  extends VerifyCodeSignController {
  
  late String email ;
  String ? code  ;

  StatusResponse status = StatusResponse.initial ;
  VerifyCodeSignUp service = VerifyCodeSignUp(Get.find());

@override
  void onInit() {
    email = Get.arguments["email"];
   
    super.onInit();
  }

  
  @override
  checkCode(String code) async{
    status = StatusResponse.loading ;
    update();
   var response = await service.verifycode_request(email:email ,code: code);

    status = handle_Res(response);
    if(status==StatusResponse.success)
    {
      if(response["status"]=="success")
      {
        Get.offNamed(AppRoute.successsignup);
      }else{
      Get.defaultDialog(title: "Warning",middleText: response["status"]);
    }

    }
    update();
  }
  

 
  

 }