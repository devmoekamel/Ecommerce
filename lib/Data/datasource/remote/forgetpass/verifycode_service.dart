import '../../../../core/class/CRUD.dart';
import '../../../../link_api.dart';

class VerifyCodeService {
  
Crud crud ;

VerifyCodeService(this.crud);

verifycode_request({required String email,required String code})
async{
var res  = await crud.PostData(ApiLink.verifycode, {
  "email":email,
  "code":code

});

return res.fold((l) => l, (r) => r);


}



}