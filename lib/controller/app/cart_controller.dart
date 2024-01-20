
import 'package:get/get.dart';

import '../../Data/datasource/remote/app/cart_service.dart';
import '../../core/class/status_response.dart';
import '../../core/functions/handle_res.dart';
import '../../core/services/services.dart';

class CartController extends GetxController {

  StatusResponse status = StatusResponse.initial;
  CartService service = CartService(Get.find());
  APPServices appServices = Get.find();

 int totalprice = 0 ;
 late int count=0  ;

List  cartlist = [];

  
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
    var res = await service.addtocart(
        itemid: itemid, userid: appServices.pref.getString("userid")!);
    // print(res);
    status = handle_Res(res);
    if (status == StatusResponse.success) {
      if (res["status"] == "success") {
        status = StatusResponse.success;
        Get.snackbar("attention", "Product addedd to Your Cart List");
        add();
      await  viewcart();
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
    var res = await service.removefromcart(
        itemid: itemid, userid: appServices.pref.getString("userid")!);
    // print(res);
    status = handle_Res(res);
    if (status == StatusResponse.success) {
      if (res["status"] == "success") {
        status = StatusResponse.success;
        Get.snackbar("attention", "Product Removed from Your Cart List");
        remove();
       await  viewcart();

      } else {
        status = StatusResponse.failure;
      }
    } else {
      status = StatusResponse.serverfailure;
    }
    update();
  }




  viewcart() async {
    cartlist.clear();
    status = StatusResponse.loading;
    update();
    var res = await service.viewcart(
       userid: appServices.pref.getString("userid")!);
    // print(res);
    status = handle_Res(res);
    if (status == StatusResponse.success) {
      if (res["status"] == "success" && res["datacart"] is List ) {
        status = StatusResponse.success;
        cartlist.addAll(res["datacart"]);
       totalprice =  res["countprice"]["totalprice"];
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
    await viewcart();
    super.onInit();
  }
getcount({required String itemid}) async {
    // cartlist.clear();
     status = StatusResponse.loading;
    update();
    var res = await service.countitems(
       userid: appServices.pref.getString("userid")!,
      itemid: itemid );
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
