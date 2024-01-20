
import 'package:get/get.dart';

import '../../controller/app/home_controller.dart';
import '../../core/class/CRUD.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(HomeControllerImp());
      // Get.put(FavoriteController());
  }




}