
import 'package:get/get.dart';

import '../../Data/datasource/remote/address/address_service.dart';
import '../../Data/models/address_model.dart';
import '../../core/class/status_response.dart';
import '../../core/constant/approute.dart';
import '../../core/functions/handle_res.dart';
import '../../core/services/services.dart';

class AddressController extends GetxController{

  StatusResponse status = StatusResponse.initial;
AddressService service = AddressService(Get.find());
APPServices  appServices = Get.find();
List<AddressModel> addresses =[];


addressView()
async{
  addresses.clear();
status = StatusResponse.loading;
update();

var response = await service.view_address(userid:appServices.pref.getString("userid").toString());

status = handle_Res(response);

if(status == StatusResponse.success)
{
  if(response["status"] is String)
  {
      status = StatusResponse.success ;
      List res = response["data"];
      addresses.addAll(res.map((e) => AddressModel.fromJson(e)));
  }else{
    status = StatusResponse.failure ;
  }
}
update();

} 

addressDelete({required int addressid})
async{
status = StatusResponse.loading;
update();

var response = await service.delete_address(addressid: addressid.toString());

status = handle_Res(response);

if(status == StatusResponse.success)
{
  if(response["status"] =="success")
  {
      status = StatusResponse.success ;
    Get.snackbar("success", "Your address deleted successfully");
  }else{
    status = StatusResponse.failure ;
    Get.snackbar("failed", "something went wrong");
  }
}
await addressView();
update();

} 


gotoAddAdress(){
  
  Get.toNamed(AppRoute.addressadd);
}

@override
  void onInit() async{
  await  addressView();
    super.onInit();
  }

}