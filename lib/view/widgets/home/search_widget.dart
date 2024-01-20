
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Data/models/items_model.dart';
import '../../../controller/app/home_controller.dart';
import '../../../link_api.dart';

class SearchWidget extends GetView<HomeControllerImp> {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>  SizedBox(height: 10.h,),
      itemCount: controller.searchitems.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => 
   SearchCard(itemsModel: controller.searchitems[index])
    
    );
  }
}



class SearchCard extends GetView<HomeControllerImp> {
  ItemsModel itemsModel ;
  // Map data ;
   SearchCard({Key? key
  , required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => controller.gottoproduct_detail(itemsModel) ,
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: CachedNetworkImage(
                imageUrl: "${ApiLink.itemsimag}/${itemsModel.itemsImg}",
                // placeholder: (context, url) => CircularProgressIndicator(),
                // errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
           Expanded(
                flex: 4,
                child: ListTile(
                  title: Text("${itemsModel.itemsName}"),
                  subtitle: Text("${itemsModel.categoriesName}"),
                ),
              ),
           
          ],
        ),
      ),
    );
  }
}
