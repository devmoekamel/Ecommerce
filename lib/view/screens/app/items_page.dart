import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Data/models/items_model.dart';
import '../../../controller/app/items_controller.dart';
import '../../../core/class/handling_view.dart';
import '../../../link_api.dart';
import '../../widgets/customhome_bar.dart';
import '../../widgets/items/customitems_list.dart';
import '../../widgets/items/listcat_items.dart';

class ItemsPage extends GetView<ItemsControllerImp> {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ItemsControllerImp>(
        builder: (controller) => 
         Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              CustomAppBarHome(
                  textcontroller: controller.searchcontroller,
                  onChanged: (val) => controller.onchage(val),
                  hinttext: "Find Product",
                  onPressedsearch: () => controller.onsearch(),
                  onPressedfav: () => controller.gotofavpage()),
            
           !controller.searching?
              Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const ListCategoriesItmes(),
                  GetBuilder<ItemsControllerImp>(
                    builder: (controller) => HandelingView(
                        statusResponse: controller.status,
                        widget: CustomItemsList()),
                  )
                ],
              ):
              HandelingView(
                statusResponse: controller.status,
                widget: SearchWidgetforitems())
            ],
          ),
        ),
      ),
    );
  }
}





class SearchWidgetforitems extends GetView<ItemsControllerImp> {
  const SearchWidgetforitems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10,),
      itemCount: controller.searchitems.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => 
   SearchCard(itemsModel: controller.searchitems[index])
    
    );
  }
}



class SearchCard extends GetView<ItemsControllerImp> {
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
