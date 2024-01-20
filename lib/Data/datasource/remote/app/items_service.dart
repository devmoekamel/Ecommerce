import '../../../../core/class/CRUD.dart';
import '../../../../link_api.dart';

class ItemsService {
  
Crud crud ;

ItemsService(this.crud);

getdata({required int catid,required String userid})
async{
var res  = await crud.PostData(ApiLink.items,{"catid":catid.toString(),"userid":userid.toString()});

return res.fold((l) => l, (r) => r);


}



}