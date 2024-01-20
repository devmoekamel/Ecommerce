
import 'package:get/get.dart';

import '../../controller/forgetpass/forgetpass_controller.dart';
import '../../core/class/CRUD.dart';

class ForgetPassBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(Crud());
   Get.put(ForgetPasscontrollerImp());
  
  }

}