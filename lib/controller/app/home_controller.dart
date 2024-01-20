
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Data/datasource/remote/app/home_service.dart';
import '../../Data/models/items_model.dart';
import '../../core/class/status_response.dart';
import '../../core/constant/approute.dart';
import '../../core/functions/handle_res.dart';
import '../../core/services/services.dart';

abstract class HomeController extends GetxController {
  getdata();
  gotoItemspage(List catlist, int which, int categoryid);
  searchproducts();
  gotofavpage();
  gottoproduct_detail(ItemsModel itemmodel);
}

class HomeControllerImp extends HomeController {
// data
  String? username;
  String? id;
  List categories = [];
  List items = [];
  String? lang;
//search
  bool searching = false;
// String searchtext = "";
  late TextEditingController searchcontroller;
  List<ItemsModel> searchitems =[];

//api

  StatusResponse status = StatusResponse.initial;
  HomeService service = HomeService(Get.find());

// shared service
  APPServices appServices = Get.find();

  @override
  void onInit() {
    lang = appServices.pref.getString("lang");
    searchcontroller = TextEditingController();
    getdata();
    // print(appServices.pref.getString("logged"));
    super.onInit();
  }

  @override
  getdata() async {
    status = StatusResponse.loading;
    update();
    var res = await service.getdata();
    status = handle_Res(res);
    if (status == StatusResponse.success) {
      if (res['status'] == "success") {
        status = StatusResponse.success;
        categories.addAll(res['categories']);
        items.addAll(res['items']);
      } else {
        Get.defaultDialog(title: "warning", middleText: "somthing went wrong ");
      }
    }
    update();
  }

  @override
  gotoItemspage(catlist, which, categoryid) {
    Get.toNamed(AppRoute.itemspage, arguments: {
      "categories": catlist,
      "which": which,
      "categoryid": categoryid
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
    var res = await service.searching(
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


  @override
  gottoproduct_detail(itemmodel) {
    
    Get.toNamed(AppRoute.productdetails,arguments: {
      "product":itemmodel
    });



  }



}
