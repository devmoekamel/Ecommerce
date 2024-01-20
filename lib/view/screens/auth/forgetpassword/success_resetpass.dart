
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/appcolor.dart';
import '../../../../core/constant/approute.dart';
import '../../../widgets/auth/custombuttonauth.dart';

class SuccessResetPass extends StatelessWidget {
   SuccessResetPass({super.key});
    // SuccessSignUpControllerImp con = Get.put(SuccessSignUpControllerImp()); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
            backgroundColor: AppColor.background,
            centerTitle: true,
            title: Text(
              "33".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppColor.grey),
            ),
            elevation: 0.0,
          ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h,),
            Center(child: Icon(Icons.check_circle,size: 200,color: Colors.green,)),
            Text("55".tr),
            
            SizedBox(height: 30.h,),

            CustomButtonAuth(buttontext: "35".tr,onPressed: () =>Get.offAllNamed(AppRoute.login) ,)
            

          ],
        ),
      ),
    );
  }
}