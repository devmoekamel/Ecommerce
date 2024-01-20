
import 'package:ecommrecemvc/view/widgets/cart/cart_button.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class CartBottomNavBar extends StatelessWidget {
  String price;
  String shipingcost;
  String totalprice;
  void Function()? onPressed;
  CartBottomNavBar({
    super.key,
    required this.price,
    required this.shipingcost,
    required this.totalprice,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Price"), Text(price)],
            ),
          ),
          Container(
             padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ const Text("Shiping Cost"), Text(shipingcost)],
            ),
          ),
          Divider(
            indent: 30,
            endIndent: 30,
          ),
          Container(
             padding:const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             const   Text(
                  "Total Price",
                  style: TextStyle(color: AppColor.primarycolor),
                ),
                Text(totalprice)
              ],
            ),
          ),
          CustomButtonCart(
            onPressed: onPressed,
            text: "Check out",
          )
        ],
      ),
    );
  }
}
