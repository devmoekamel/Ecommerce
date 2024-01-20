import '../../../../core/class/CRUD.dart';
import '../../../../link_api.dart';

class LoginService {

Crud crud ;

LoginService(this.crud);

// ignore: non_constant_identifier_names
Login_request({required String email ,required String password })
async{
  var res = await crud.PostData(ApiLink.login,{
      "email":email,
      "password":password
     });

  print(res);
     return res.fold((l) => l, (r) => r);
  
}

}

