
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Data/models/items_model.dart';
import '../../../controller/app/fav_controller.dart';
import '../../../core/constant/appcolor.dart';
import '../../../link_api.dart';

class FavList extends GetView<FavoriteController> {
  const FavList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10,),
      itemCount: controller.favlist.length,
      itemBuilder: (context, index) =>  FavCard(itemModel: ItemsModel.fromJson(controller.favlist[index]))
      
    );
  }
}

class FavCard extends GetView<FavoriteController> {
 final ItemsModel itemModel ;
   FavCard( {
    super.key,
    required this.itemModel
  });


  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
          alignment: Alignment.center,
          height: 180.h,
          // color: Colors.yellow,
          // padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(children: [
            Container(
              width: 150.w,
              // color: Colors.green,
              // alignment: Alignment.center,
              child: Image.network("${ApiLink.itemsimag}/${itemModel.itemsImg}"),
            ),
            Container(
              alignment: Alignment.center,
              // margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${itemModel.itemsName}"),
                  // Text("300"),
                  Text("Price : ${itemModel.itemsPrice}"),
                  GetBuilder<FavoriteController>(
                    builder: (controller) => IconButton(
                        onPressed: () {
                          controller.removetofav(itemModel.itemsId.toString());
                          controller.viewfav();
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: AppColor.primarycolor,
                        )),
                  )
                ],
              ),
            ),
          ]),
        ),
      );
  }
}