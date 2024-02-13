import '../../../../core/class/CRUD.dart';
import '../../../../link_api.dart';

class AddressService {
  Crud crud;

  AddressService(this.crud);

  view_address({required String userid}) async {
    var res = await crud.PostData(ApiLink.addressview, {"userid": userid});

    return res.fold((l) => l, (r) => r);
  }

  add_address({
    required String userid,
    required String nameofaddress,
    required String city,
    required String street,
    required double lat,
    required double long,
  }) async {
    var res = await crud.PostData(ApiLink.addressadd, {
      "userid": userid,
      "name": nameofaddress,
      "city": city,
      "street": street,
      "lat": lat.toString(),
      "long": long.toString()
    });

    return res.fold((l) => l, (r) => r);
  }

  delete_address({required String addressid}) async {
    var res =
        await crud.PostData(ApiLink.addressdelete, {"addressid": addressid});

    return res.fold((l) => l, (r) => r);
  }


}

// Get_route_func

  // route_request(
  //     {required double start_long,
  //     required double start_lat,
  //     required double end_long,
  //     required double end_lat}) async {
  //   var response = await crud.GetData(
  //       "http://router.project-osrm.org/route/v1/driving/$start_lat,$start_long;$end_lat,$end_long?steps=true&annotations=true&geometries=geojson&overview=full");
  //   // print(response);
  //   return response.fold((l) => l, (r) => r);
  // }