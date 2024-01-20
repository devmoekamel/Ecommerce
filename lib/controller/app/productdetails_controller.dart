
import 'package:get/get.dart';

import '../../Data/datasource/remote/app/cart_service.dart';
import '../../Data/models/items_model.dart';
import '../../core/class/status_response.dart';
import '../../core/functions/handle_res.dart';
import '../../core/services/services.dart';

abstract class ProductDetailController extends GetxController{
  initialData();

}


class ProductDetailControllerImp extends ProductDetailController{
 
//
// CartController cart = Get.put(CartController());
//
 late ItemsModel itemsModel ; 
StatusResponse status = StatusResponse.initial;

CartService cartService = CartService(Get.find());
APPServices appServices = Get.find();
 List found = [
  {"name":"Red","id":1,"active":1},
  {"name":"Black","id":2,"active":0},
  {"name":"Yellow","id":3,"active":0},
 ];
 
 late int count = 0  ;


 @override
  void onInit()async {
 await initialData();
 await getcount();
  super.onInit();
  }
 
 
 
 
  @override
  initialData() {
    itemsModel = Get.arguments["product"];
  }

add(){

count++;

}

remove(){
if(count>0)
{count--;}

}



  addtoCart(String itemid) async {
    status = StatusResponse.loading;
    // update();
    var res = await cartService.addtocart(
        itemid: itemid, userid: appServices.pref.getString("userid")!);
    // print(res);
    status = handle_Res(res);
    if (status == StatusResponse.success) {
      if (res["status"] == "success") {
        status = StatusResponse.success;
        Get.snackbar("attention", "Product addedd to Your Cart List");
        add();
      } else {
        status = StatusResponse.failure;
      }
    } else {
      status = StatusResponse.serverfailure;
    }
    update();
  }

  removetocart(String itemid) async {
    status = StatusResponse.loading;
    // update();
    var res = await cartService.removefromcart(
        itemid: itemid, userid: appServices.pref.getString("userid")!);
    // print(res);
    status = handle_Res(res);
    if (status == StatusResponse.success) {
      if (res["status"] == "success") {
        status = StatusResponse.success;
        Get.snackbar("attention", "Product Removed from Your Cart List");
        remove();
      } else {
        status = StatusResponse.failure;
      }
    } else {
      status = StatusResponse.serverfailure;
    }
    update();
  }
getcount() async {
    // cartlist.clear();
     status = StatusResponse.loading;
    update();
    var res = await cartService.countitems(
       userid: appServices.pref.getString("userid")!,
      itemid: itemsModel.itemsId.toString() );
    // print(res);
    status = handle_Res(res);
    if (status == StatusResponse.success) {
      if (res["status"] == "success"  ) {
        status = StatusResponse.success;
        
       count =  res["data"];
      } else {
        status = StatusResponse.failure;
      }
    } else {
      status = StatusResponse.serverfailure;
    }

    update();
  }

}
