
import 'package:get/get.dart';

import '../../controller/forgetpass/verifycode_controller.dart';
import '../../core/class/CRUD.dart';

class VerifyCodeBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(Crud());
   Get.put(VerifyCodeControllerImp());
  
  }

}