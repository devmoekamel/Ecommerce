import '../../../../core/class/CRUD.dart';
import '../../../../link_api.dart';

class ResetPassService {
  
Crud crud ;

ResetPassService(this.crud);

resetpass_request({required String email, required String password})
async{
var res  = await crud.PostData(ApiLink.resetpass, {
  "email":email,
  "password":password
});

return res.fold((l) => l, (r) => r);


}



}