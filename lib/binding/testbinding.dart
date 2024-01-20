
import 'package:get/get.dart';

import '../controller/testcontroller.dart';
import '../core/class/CRUD.dart';

class testbidning extends Bindings{
  @override
  void dependencies() {
      Get.put(Crud());
      Get.put(TestController());
    }



}