
import '../../../core/class/CRUD.dart';

class TestData {

  Crud crud ;
  TestData(this.crud);



  getdata()async{
  var  res = await crud.PostData("https://just4funecho.000webhostapp.com/ecommerce/auth/test.php", {});
   
  return res.fold((l) => l, (r) => r);
  }

}