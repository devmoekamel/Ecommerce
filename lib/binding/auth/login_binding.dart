
import 'package:get/get.dart';

import '../../controller/auth/login_controller.dart';
import '../../core/class/CRUD.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(Crud());
   Get.put(LoginControllerImp());
  
  }

}