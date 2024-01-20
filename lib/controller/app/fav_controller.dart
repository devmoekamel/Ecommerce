
import 'package:get/get.dart';

import '../../Data/datasource/remote/app/fav_service.dart';
import '../../core/class/status_response.dart';
import '../../core/functions/handle_res.dart';
import '../../core/services/services.dart';

class FavoriteController extends GetxController {
  Map fav = {};

  StatusResponse status = StatusResponse.initial;
  favouriteService service = favouriteService(Get.find());
  APPServices appServices = Get.find();

  List favlist = [];


  



  setvalue(key, val) {
    fav[key] = val;

    update();
  }

  addtofav(String itemid) async {
    status = StatusResponse.loading;
    // update();
    var res = await service.addtofavourite(
        itemid: itemid, userid: appServices.pref.getString("userid")!);
    // print(res);
    status = handle_Res(res);
    if (status == StatusResponse.success) {
      if (res["status"] == "success") {
        status = StatusResponse.success;
        Get.snackbar("attention", "Product addedd to Your Favourite List");
      } else {
        status = StatusResponse.failure;
      }
    } else {
      status = StatusResponse.serverfailure;
    }
  }

  removetofav(String itemid) async {
    status = StatusResponse.loading;
    // update();
    var res = await service.removefromfavourite(
        itemid: itemid, userid: appServices.pref.getString("userid")!);
    // print(res);
    status = handle_Res(res);
    if (status == StatusResponse.success) {
      if (res["status"] == "success") {
        status = StatusResponse.success;
        Get.snackbar("attention", "Product Removed to Your Favourite List");
      } else {
        status = StatusResponse.failure;
      }
    } else {
      status = StatusResponse.serverfailure;
    }
  }




  viewfav() async {
    favlist.clear();
    status = StatusResponse.loading;
    update();
    var res = await service.viewfavourite(
       userid: appServices.pref.getString("userid")!);
    // print(res);
    status = handle_Res(res);
    if (status == StatusResponse.success) {
      if (res["status"] == "success") {
        status = StatusResponse.success;
        favlist.addAll(res["data"]);
      } else {
        status = StatusResponse.failure;
      }
    } else {
      status = StatusResponse.serverfailure;
    }

    update();
  }




@override
  void onInit()async {
    await viewfav();
    super.onInit();
  }



}
