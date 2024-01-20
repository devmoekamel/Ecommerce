import 'package:ecommrecemvc/core/services/services.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{


APPServices services = Get.find();

late String email ;
late String phone ;
late String username;



@override
  void onInit() {
    super.onInit();
    email = services.pref.getString("email")!;
    phone = services.pref.getString("phone")!;
    username = services.pref.getString("username")!;


  }













}