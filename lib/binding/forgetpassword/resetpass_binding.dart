
import 'package:get/get.dart';

import '../../controller/forgetpass/resetpass_controller.dart';
import '../../core/class/CRUD.dart';

class ResetPassBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(Crud());
   Get.put(ResetPasscontrollerImp());
  
  }

}