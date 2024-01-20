
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Data/models/categories_model.dart';
import '../../../controller/app/home_controller.dart';
import '../../../core/constant/appcolor.dart';
import '../../../core/functions/translate_database.dart';
import '../../../link_api.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          // separatorBuilder: (context, index) => SizedBox(width: 30,),
          itemBuilder: (context, index) => CategoriesHome(
            which:index,
            categoriesModel: CategoriesModel.fromJson(controller.categories[index])),
        ));
  }
}

// ignore: must_be_immutable
class CategoriesHome extends GetView<HomeControllerImp> {

  CategoriesModel  categoriesModel;
  final int which ;
 CategoriesHome({
    super.key,
    required this.categoriesModel,required this.which
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>controller.gotoItemspage(controller.categories,which,categoriesModel.categoriesId!),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColor.secondcolor),
            child: SvgPicture.network(
              color:Colors.white,
              "${ApiLink.cateimag}/${categoriesModel.categoriesImg}",
              width: 20.w,
            ),
          ),
          Text("${TranslateDB(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}")
        ],
      ),
    );
  }
}

