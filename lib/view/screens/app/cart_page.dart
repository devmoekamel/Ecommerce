// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/app/cart_controller.dart';
import '../../../core/class/handling_view.dart';
import '../../widgets/cart/Cart_buttomnavbar.dart';
import '../../widgets/cart/cart_list.dart';

class CartPage extends StatelessWidget {

  CartController cartController = Get.put(CartController());
   CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          centerTitle: true,
        ),
      
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: GetBuilder<CartController>(
            builder:(controller) => HandelingView(
              statusResponse: controller.status,
              widget: CartItemList())),
        ),
        
          bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) =>  CartBottomNavBar(
              onPressed: () {},
              price: cartController.totalprice.toString(),
              shipingcost: "0",
              totalprice:"${cartController.totalprice.toString()}" ),
          ),
        );
  }
}
