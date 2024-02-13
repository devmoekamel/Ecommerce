import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import '../../../controller/address/add_controller.dart';
import '../../../core/class/handling_view.dart';

class AddressAdd extends StatelessWidget {
  AddAddressController controller = Get.put(AddAddressController());
  // const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add New Adress"),
          centerTitle: true,
        ),
        body: GetBuilder<AddAddressController>(
          builder: (controller) => HandelingView(
            statusResponse: controller.status,
            widget: OpenStreetMapSearchAndPick(
                locationPinIcon: Icons.location_on_sharp,
                locationPinIconColor: Colors.black,
                locationPinText: "",
                buttonTextColor: Colors.white,
                buttonColor: Colors.black,
                buttonText: 'Set Location',
                onPicked: (pickedData) {
                  controller.addAddress(
                    nameofaddress: pickedData.addressName,
                    street: pickedData.address["road"],
                    city: pickedData.address["town"],
                    lat: pickedData.latLong.latitude,
                    long: pickedData.latLong.longitude,
                  );
                  // print(pickedData.address);
                }),
          ),
        ));
  }
}
