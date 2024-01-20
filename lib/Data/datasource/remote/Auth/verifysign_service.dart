import '../../../../core/class/CRUD.dart';
import '../../../../link_api.dart';


class VerifyCodeSignUp {

  Crud crud ;
  VerifyCodeSignUp(this.crud);



  verifycode_request({required String email,required String code})async{
  var  res = await crud.PostData(ApiLink.verifycodesign ,{
    "email": email,
    "code": code, 
  });
   
  return res.fold((l) => l, (r) => r);
  }

}