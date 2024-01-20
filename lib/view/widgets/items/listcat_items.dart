
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Data/models/categories_model.dart';
import '../../../controller/app/items_controller.dart';
import '../../../core/constant/appcolor.dart';
import '../../../core/functions/translate_database.dart';

class ListCategoriesItmes extends GetView<ItemsControllerImp> {
  const ListCategoriesItmes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          // separatorBuilder: (context, index) => SizedBox(width: 30,),
          itemBuilder: (context, index) => CategoriesItems(
              which: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index])),
        ));
  }
}

class CategoriesItems extends GetView<ItemsControllerImp> {
  CategoriesModel categoriesModel;
  final int which;
  
  CategoriesItems(
      {super.key, required this.categoriesModel, required this.which});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>controller.changeCat(which,categoriesModel.categoriesId!),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            GetBuilder<ItemsControllerImp>(
              builder:(controller) => 
               Container(
                decoration: controller.selectcat==which?BoxDecoration(
                  border: Border(bottom: BorderSide(width:3.w,color: AppColor.primarycolor))
                ):null,
                child: Text(
                  "${TranslateDB(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
