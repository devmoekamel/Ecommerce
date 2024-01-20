
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpass/resetpass_controller.dart';
import '../../../../core/class/handling_view.dart';
import '../../../../core/constant/appcolor.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widgets/auth/custombodyauth.dart';
import '../../../widgets/auth/custombuttonauth.dart';
import '../../../widgets/auth/customtextform.dart';
import '../../../widgets/auth/customtitleauth.dart';

class ResetPass extends StatelessWidget {

  ResetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        centerTitle: true,
        title: Text(
          "50".tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
        elevation: 0.0,
      ),
      body: GetBuilder<ResetPasscontrollerImp>(
        builder: (controller) =>
        HandelingViewReq(
        statusResponse: controller.status,
          widget: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            child: Form(
              key: controller.formkey,
              child: ListView(
                children: [
                  CustomTitleAuth(title:"51".tr),
                   SizedBox(height: 20.h),
                  CustomBodyAuth(
                  bodytext: "52".tr,
                  ),
                   SizedBox(height: 60.h),
                  CustomTextForm(
                    isnumber: false,
                    valid: (value) {return validinput(value!, 8, 30, "Password");},
                    textController: controller.Password,
                    icon: Icons.key,
                    hinttext: "14".tr,
                    labeltext: "15".tr,
                  ),
                   SizedBox(height: 30.h),
                  CustomTextForm(
                    isnumber: false,
                    valid: (value) {return validinput(value!, 8, 30, "Password");},
                    textController: controller.rePassword,
                    icon: Icons.key,
                    hinttext: "53".tr,
                    labeltext: "15".tr,
                  ),
                   SizedBox(height: 20.h),
                  CustomButtonAuth(buttontext:"54".tr, onPressed: () => controller.changepass(),),
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