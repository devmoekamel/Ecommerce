
import 'package:get/get.dart';

import '../../Data/datasource/remote/forgetpass/verifycode_service.dart';
import '../../core/class/status_response.dart';
import '../../core/constant/approute.dart';
import '../../core/functions/handle_res.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String code);
}

class VerifyCodeControllerImp extends VerifyCodeController {
// argument
  late String email;
// api

  StatusResponse status = StatusResponse.initial;
  VerifyCodeService service = VerifyCodeService(Get.find());
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  checkCode(String code) async{
    status = StatusResponse.loading ;
    update();
    var res = await service.verifycode_request(email: email, code:code );

    status  = handle_Res(res);
 if(status == StatusResponse.success)
    {
      if(res["status"]=="success")
      {
        status = StatusResponse.success ;
          Get.offNamed(AppRoute.resetpassword,arguments: {
            "email":email
          });
      }else{
        status = StatusResponse.failure ;
        Get.defaultDialog(title: "Warning",middleText:"verifcationcode is wrong " );
      }
    }
    update();
  }
}
