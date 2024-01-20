
import 'package:get/get.dart';

import '../../controller/auth/verifycodesign_controller.dart';
import '../../core/class/CRUD.dart';


class VerifySignBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(Crud());
   Get.put(VerifyCodeSignControllerImp());
  
  }

}