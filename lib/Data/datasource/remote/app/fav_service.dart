import '../../../../core/class/CRUD.dart';
import '../../../../link_api.dart';

class favouriteService {
  
Crud crud ;

favouriteService(this.crud);



viewfavourite({required String userid})
async{
var res  = await crud.PostData(ApiLink.favview,{
  "userid":userid,
  });

return res.fold((l) => l, (r) => r);


}


addtofavourite({required String userid,required String itemid})
async{
var res  = await crud.PostData(ApiLink.favadd,{
  "userid":userid,
  "itemid":itemid
});

return res.fold((l) => l, (r) => r);


}

removefromfavourite({required String userid,required String itemid})
async{
var res  = await crud.PostData(ApiLink.favremove,{
  "userid":userid,
  "itemid":itemid
});

return res.fold((l) => l, (r) => r);


}



}