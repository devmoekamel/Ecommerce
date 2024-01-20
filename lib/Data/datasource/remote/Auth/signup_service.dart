import '../../../../core/class/CRUD.dart';
import '../../../../link_api.dart';


class SignUPService {

  Crud crud ;
  SignUPService(this.crud);



  Signup_request({required String username,required String email,required String phone,required String password})async{
  var  res = await crud.PostData(ApiLink.signup ,{
    "username":username ,
    "email": email,
    "phone": phone,
    "password": password,
    
  });
   
  return res.fold((l) => l, (r) => r);
  }

}