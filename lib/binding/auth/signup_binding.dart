import 'package:get/get.dart';

import '../../controller/auth/signup_controller.dart';
import '../../core/class/CRUD.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(Crud());
   Get.put(SignupControllerImp());
  
  }

}