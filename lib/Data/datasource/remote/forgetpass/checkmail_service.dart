import '../../../../core/class/CRUD.dart';
import '../../../../link_api.dart';

class CheckEmailService {
  
Crud crud ;

CheckEmailService(this.crud);

checkemail_request({required String email})
async{
var res  = await crud.PostData(ApiLink.checkmail, {
  "email":email
});

return res.fold((l) => l, (r) => r);


}



}