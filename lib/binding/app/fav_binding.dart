
import 'package:get/get.dart';

import '../../controller/app/fav_controller.dart';

class FavBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoriteController());

  }




}