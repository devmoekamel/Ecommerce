
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/app/home_controller.dart';
import '../../../core/class/handling_view.dart';
import '../../widgets/home/customheader_text.dart';
import '../../widgets/customhome_bar.dart';
import '../../widgets/home/customoffers_card.dart';
import '../../widgets/home/list_categories.dart';
import '../../widgets/home/list_items.dart';
import '../../widgets/home/search_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            CustomAppBarHome(
              textcontroller: controller.searchcontroller,
              hinttext: "Find Product",
              onChanged: (val) => controller.onchage(val),
              onPressedsearch: () => controller.onsearch(),
              onPressedfav: () => controller.gotofavpage(),
            ),
            !controller.searching
                ? HandelingView(
                    statusResponse: controller.status,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomOffersCard(
                          head: "A Summer surprise",
                          body: "CashBack 20 %",
                        ),
                         SizedBox(width: 8.w),
                        ListCategoriesHome(),
                       SizedBox(height: 10.h),
                        CustomHeaderText(
                          text: "Product For You ",
                        ),
                         SizedBox(height: 15.h),
                        const ListItemsHome(),
                         SizedBox(height:25.h),
                        // CustomHeaderText(
                        //   text: "Offers For You",
                        // ),

                        // const SizedBox(height: 25),
                        // const ListItemsHome(),
                      ],
                    ),
                  )
                : HandelingView(
                    statusResponse: controller.status,
                    widget: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: SearchWidget()),
                  )
          ],
        ),
      ),
    );
  }
}
