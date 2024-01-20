import '../../../../core/class/CRUD.dart';
import '../../../../link_api.dart';

class CartService {
  
Crud crud ;

CartService(this.crud);

viewcart({required String userid})
async{
var res  = await crud.PostData(ApiLink.viewcart,{
  "userid":userid,
  
});

return res.fold((l) => l, (r) => r);


}




addtocart({required String userid,required String itemid})
async{
var res  = await crud.PostData(ApiLink.addtocart,{
  "userid":userid,
  "itemid":itemid
});

return res.fold((l) => l, (r) => r);


}

removefromcart({required String userid,required String itemid})
async{
var res  = await crud.PostData(ApiLink.removefromcart,{
  "userid":userid,
  "itemid":itemid
});

return res.fold((l) => l, (r) => r);


}

countitems({required String userid,required String itemid})
async{
var res  = await crud.PostData(ApiLink.cartcountitems,{
  "userid":userid,
  "itemid":itemid
  
});

return res.fold((l) => l, (r) => r);


}


}