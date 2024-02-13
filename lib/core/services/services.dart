
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class APPServices extends GetxService {
  late SharedPreferences  pref ;
  Future<APPServices> init() async{
    
    pref = await SharedPreferences.getInstance() ;
    return this ;
  }

}
Request_user_location()async{
  bool serviceEnabled;
  LocationPermission permission;

serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // return Future.error(');
    print("Location services are disabled.");
  }
permission = await Geolocator.checkPermission();

if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {

      
      print("Location permissions are denied");
    }
  }

if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    
      print("Location permissions are permanently denied, we cannot request permissions.");
  } 
return await Geolocator.getCurrentPosition();
}



initservices()async{
  await Request_user_location();

  await Get.putAsync(() =>APPServices().init());
  
}