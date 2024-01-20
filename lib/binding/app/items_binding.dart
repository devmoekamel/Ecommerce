
import 'package:get/get.dart';

import '../../controller/app/fav_controller.dart';
import '../../controller/app/items_controller.dart';
import '../../core/class/CRUD.dart';

class ItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(FavoriteController());
    Get.put(ItemsControllerImp());
  
  }




}