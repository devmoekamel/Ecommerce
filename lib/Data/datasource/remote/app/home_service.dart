import '../../../../core/class/CRUD.dart';
import '../../../../link_api.dart';

class HomeService {
  Crud crud;

  HomeService(this.crud);

  getdata() async {
    var res = await crud.PostData(ApiLink.homepage, {});

    return res.fold((l) => l, (r) => r);
  }


    searching({required String search}) async {
    var res = await crud.PostData(ApiLink.search, {
      "search":search
    });

    return res.fold((l) => l, (r) => r);
  }
}
