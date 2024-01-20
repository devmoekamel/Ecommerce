
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Data/datasource/remote/app/home_service.dart';
import '../../Data/datasource/remote/app/items_service.dart';
import '../../Data/models/items_model.dart';
import '../../core/class/status_response.dart';
import '../../core/constant/approute.dart';
import '../../core/functions/handle_res.dart';
import '../../core/services/services.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int val,int catId);
  getdata(int id);
  gottoproduct_detail(ItemsModel itemmodel);
  gotofavpage();
}

class ItemsControllerImp extends ItemsController {
//arguments
  List categories = [];
  int? selectcat;
  //
late TextEditingController searchcontroller;
List<ItemsModel> searchitems =[];
bool searching = false;

  late int  categoryid;

APPServices  appServices = Get.find();
// itemservice

  ItemsService  service = ItemsService(Get.find());
    HomeService  homeservice = HomeService(Get.find());

  StatusResponse status = StatusResponse.initial ;

// data 

List items = [];


  @override
  void onInit() {
    initialData();
    searchcontroller = TextEditingController();
    getdata(categoryid);
    super.onInit();
    print(appServices.pref.getString("userid"));
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectcat = Get.arguments['which'];
    categoryid = Get.arguments['categoryid'];
    
  }

  @override
  changeCat(val,catId) {
    selectcat = val;
    categoryid = catId;
    getdata(categoryid);
    update();
  }
  
  @override
  getdata( catid) async{
    items.clear();
  status = StatusResponse.loading;
    update();
  var res = await  service.getdata(catid: catid,userid:appServices.pref.getString("userid")!) ;
  // print(res);
   status = handle_Res(res);
   if(status == StatusResponse.success)
   {
    if(res["status"]=="success")
    { 
      print(res['status']);
       status = StatusResponse.success;
        items.addAll(res['data']);

    }else{
      status= StatusResponse.failure;
    }
   }else{
    status = StatusResponse.serverfailure;
   }
    update();
  }
  
  @override
  gottoproduct_detail(itemmodel) {
    
    Get.toNamed(AppRoute.productdetails,arguments: {
      "product":itemmodel
    });



  }


  @override
  gotofavpage() {
      Get.toNamed(AppRoute.favpage);
  }


 onchage(val) {
    if (val == "") {
    status = StatusResponse.initial;

      searching = false;
    }
    update();
  }

  onsearch() {
    print(searching);
    if (searchcontroller.text != "") {
      searching = true;
      // update();
      searchproducts();
    }
  }
  

  @override
  searchproducts() async {
    searchitems.clear();
    status = StatusResponse.loading;
    update();
    var res = await homeservice.searching(
      search: searchcontroller.text
    );
    status = handle_Res(res);
    if (status == StatusResponse.success) {
      if (res['status'] == "success") {
        status = StatusResponse.success;
       List response = res["data"];
       searchitems.addAll(response.map((e) => ItemsModel.fromJson(e)));
       print(response);
      } else {
        status = StatusResponse.failure;
      }
    }
    else{
      status = StatusResponse.serverfailure;

    }
    update();



  }



}
