
import 'package:get/get.dart';

import '../../Data/datasource/remote/address/address_service.dart';
import '../../core/class/status_response.dart';
import '../../core/functions/handle_res.dart';
import '../../core/services/services.dart';

class AddAddressController extends GetxController {
  
  AddressService addressService = AddressService(Get.find());
  StatusResponse status = StatusResponse.initial;
  APPServices appServices = Get.find();

  @override
  void onInit() async {
    super.onInit();
  }

  addAddress({
    required String nameofaddress,
    required String city,
    required String street,
    required double lat,
    required double long,
  }) async {
    status = StatusResponse.loading;
    update();

    var response = await addressService.add_address(
        userid: appServices.pref.getString("userid").toString(),
        nameofaddress: nameofaddress,
        city: city,
        street: street,
        lat: lat,
        long: long);

    status = handle_Res(response);

    if (status == StatusResponse.success) {
      if (response["status"] == "success") {
        status = StatusResponse.success;
        // Get.offNamed(AppRoute.settings);
        Get.back();
        Get.snackbar("success", "Your address addedd success");
      } else {
        Get.back();
        Get.snackbar("failed", "Something went wrong");
      }
    } else {
      // Get.;
      Get.snackbar("Error", "Server error happened \n try again later");
    }
    update();
  }
}





  // getroutes() async {
    
  //   position = await Geolocator.getCurrentPosition();
  //   lat = await position!.latitude ;
  //   long = await position!.longitude ;
  //   // await Future.delayed(Duration(seconds: 3));
  //   //  routpoints=[LatLng(lat,long)];
  //   var res = await Routeservice.route_request(
  //     start_lat: 21.408072,
  //       start_long: 39.164660,        
  //       end_long: 36.093161,
  //       end_lat: 32.022514);
  //   status = handle_Res(res);

  //   if (status == StatusResponse.success) {
  //     var ruter = res['routes'][0]['geometry']['coordinates'];

  //     for (int i = 0; i < ruter.length; i++) {
  //       var reep = ruter[i].toString();
  //       reep = reep.replaceAll("[", "");
  //       reep = reep.replaceAll("]", "");
  //       var lat1 = reep.split(',');
  //       var long1 = reep.split(",");
  //       // print("${lat1},${long1}");
  //       routpoints.add(LatLng(double.parse(lat1[0]), double.parse(long1[1])));
  //     }

  //     status = StatusResponse.success;
  //   } else {
  //     print("Request Failure");
  //   }
  //   update();
  // }




      