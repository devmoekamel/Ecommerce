
import 'package:get/get.dart';

import '../../core/constant/approute.dart';
import '../../core/services/services.dart';

class SettingController extends GetxController{

APPServices appService = Get.find();





logout(){
appService.pref.clear();
Get.offAllNamed(AppRoute.language);

}

gotoaddress(){

Get.toNamed(AppRoute.address);


}



}