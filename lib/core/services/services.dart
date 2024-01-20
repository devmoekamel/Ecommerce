
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class APPServices extends GetxService {
  late SharedPreferences  pref ;
  Future<APPServices> init() async{
    
    pref = await SharedPreferences.getInstance() ;
    return this ;
  }

}



initservices()async{

 await Get.putAsync(() =>APPServices().init());
  
}