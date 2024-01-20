import 'package:get/get.dart';

import '../../core/constant/approute.dart';

abstract class SuccessSignUpController   extends GetxController{
  gotoLoginPage();
}


class SuccessSignUpControllerImp  extends SuccessSignUpController {
  

 

  @override
  gotoLoginPage() {
    Get.offAllNamed(AppRoute.login);

  }
  

 }