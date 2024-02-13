import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/address/address_controller.dart';
import '../../../core/class/handling_view.dart';
import '../../../core/constant/appcolor.dart';

class AddressView extends StatelessWidget {
  AddressView({super.key});
  @override
  Widget build(BuildContext context) {
    AddressController addressController = Get.put(AddressController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Adress"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primarycolor,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => addressController.gotoAddAdress()),
      body: GetBuilder<AddressController>(
        builder: (controller) => HandelingView(
            statusResponse: controller.status, widget: AddressList()),
      ),
    );
  }
}

class AddressList extends GetView<AddressController> {
  const AddressList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 7.h,
      ),
      itemCount: controller.addresses.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text("${controller.addresses[index].addressStreet}"),
          subtitle: Text("${controller.addresses[index].addressName}"),
          trailing: IconButton(
              onPressed: () => controller.addressDelete(
                  addressid: controller.addresses[index].addressId!),
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              )),
        ),
      ),
    );
  }
}
