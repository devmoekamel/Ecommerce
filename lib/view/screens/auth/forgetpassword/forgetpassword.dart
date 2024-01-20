
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpass/forgetpass_controller.dart';
import '../../../../core/class/handling_view.dart';
import '../../../../core/constant/appcolor.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widgets/auth/custombodyauth.dart';
import '../../../widgets/auth/custombuttonauth.dart';
import '../../../widgets/auth/customtextform.dart';
import '../../../widgets/auth/customtitleauth.dart';


class ForgetPass extends StatelessWidget {

  ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        centerTitle: true,
        title: Text(
          "36".tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
        elevation: 0.0,
      ),
      body: GetBuilder<ForgetPasscontrollerImp>(
        builder: (controller) => 
          HandelingViewReq(
            statusResponse: controller.status,  
            widget: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            child: Form(
              key: controller.formkey,
              child: ListView(
                children: [
                  CustomTitleAuth(title: "29".tr),
                   SizedBox(height: 20.h),
                  CustomBodyAuth(
                    bodytext: "37".tr,
                  ),
                   SizedBox(height: 60.h),
                  CustomTextForm(
                    isnumber: false,
                    valid: (value) {return validinput(value!, 8, 100, "email");},
                    textController: controller.email,
                    icon: Icons.mail,
                    hinttext: "12".tr,
                    labeltext: "13".tr,
                  ),
                   SizedBox(height: 20.h),
                  CustomButtonAuth(
                    onPressed: () => controller.checkEmail(),
                    buttontext: "32".tr),
                ],
              ),
            ),
                    ),
          ),
      ),
    );
  }
}





//  "You Don't have account? "