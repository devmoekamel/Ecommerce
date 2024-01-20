import 'package:get/get.dart';

import '../services/services.dart';

TranslateDB(colum_ar,colum_en){

APPServices service = Get.find();

if(service.pref.getString("lang")=="ar")
{
  return colum_ar;
}else{
  return colum_en;
}



}