
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../../controller/app/cart_controller.dart';
import '../../../link_api.dart';

class CartItemList extends GetView<CartController> {
  const CartItemList({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      children: List.generate(controller.cartlist.length, (index) => CartCard(
        data: controller.cartlist[index],

      )),
    );
  }
}

class CartCard extends GetView<CartController> {
  Map data ;
   CartCard({Key? key
  ,required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CachedNetworkImage(
              imageUrl: "${ApiLink.itemsimag}/${data["items_img"]}",
              // placeholder: (context, url) => CircularProgressIndicator(),
              // errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          GetBuilder<CartController>(
          builder: (controller) => Expanded(
              flex: 3,
              child: ListTile(
                title: Text("${data["items_name"]}"),
                subtitle: Text("${data["itemsprice"].toString()}"),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                IconButton(onPressed: () {
                  controller.addtoCart(data["cart_item"].toString());
                  // controller.viewcart();
                }, icon: Icon(Icons.add)),
                GetBuilder<CartController>(builder:(controller) =>  Text("${data["itemscount"]}")),
                IconButton(onPressed: () {
                  controller.removetocart(data["cart_item"].toString());
                  //  controller.viewcart();
                }, icon: Icon(Icons.remove)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
