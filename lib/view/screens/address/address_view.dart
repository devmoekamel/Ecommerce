
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/address_controller.dart';
import '../../../core/constant/appcolor.dart';

class AddressView extends StatelessWidget {
  
   AddressController addressController = Get.put(AddressController());
   AddressView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adress"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primarycolor,
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: ()=>addressController.gotoAddAdress()),
      body: Center(child: Text("address view",),),
    );
  }
}