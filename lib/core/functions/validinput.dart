import 'package:get/get.dart';

validinput(String val,int min ,int max ,String type)
{
  if (type=="username"){
    if(!GetUtils.isUsername(val)){return "not valid username";}
  }
  if (type=="email"){
    if(!GetUtils.isEmail(val)){return "not valid Email";}
  }
 if (type=="phone"){
    if(!GetUtils.isPhoneNumber(val)){return "not valid Phone Number";}
  }
if(val.length>max){return "can't be longer than $max ";}
if(val.length<min){return "can't be smaller than $min ";}
if(val.isEmpty){return "can't be Empty ";}
}