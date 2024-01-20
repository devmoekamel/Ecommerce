
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/class/CRUD.dart';
import '../../../core/class/handling_view.dart';
import '../../../core/constant/appcolor.dart';
import '../../../core/constant/approute.dart';
import '../../../core/functions/exit_alert.dart';
import '../../../core/functions/validinput.dart';
import '../../widgets/auth/custombodyauth.dart';
import '../../widgets/auth/custombuttonauth.dart';
import '../../widgets/auth/customlogtext.dart';
import '../../widgets/auth/customtextform.dart';
import '../../widgets/auth/customtitleauth.dart';

// ignore: must_be_immutable
class SignUP extends StatelessWidget {
  SignupControllerImp con = Get.find();
  Crud crud = Get.find();
  SignUP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        centerTitle: true,
        title: Text(
          "20".tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
        elevation: 0.0,
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) => exitalert(),
        child: GetBuilder<SignupControllerImp>(
          builder: (controller) => 
         HandelingViewReq(
          statusResponse: controller.status,
           widget: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: Form(
                key: con.formkey,
                child: ListView(
                  children: [
                    CustomTitleAuth(title: "10".tr),
                     SizedBox(height: 20.h),
                    CustomBodyAuth(
                      bodytext: "21".tr,
                    ),
                     SizedBox(height: 30.h),
                    CustomTextForm(
                      isnumber: false,
                      valid: (value) {
                        return validinput(value!, 8, 30, "username");
                      },
                      textController: con.username,
                      icon: Icons.person,
                      hinttext: "22".tr,
                      labeltext: "23".tr,
                    ),
                     SizedBox(height: 30.h),
                    CustomTextForm(
                      isnumber: false,
                      valid: (value) {
                        return validinput(value!, 8, 100, "email");
                      },
                      textController: con.email,
                      icon: Icons.mail,
                      hinttext: "12".tr,
                      labeltext: "13".tr,
                    ),
                     SizedBox(height: 30.h),
                    CustomTextForm(
                      isnumber: true,
                      valid: (value) {
                        return validinput(value!, 8, 30, "phone");
                      },
                      textController: con.phone,
                      icon: Icons.phone_android,
                      hinttext: "24".tr,
                      labeltext: "25".tr,
                    ),
                     SizedBox(height: 30.h),
                    GetBuilder<SignupControllerImp>(builder: (controller) =>CustomTextForm(
                        ontapicon:() =>controller.showpassword() ,
                        secure:controller.showpass ,                       
                        isnumber: false,
                        valid: (value) {
                          return validinput(value!, 8, 30, "password");
                        },
                        textController: con.password,
                        icon: Icons.lock,
                        hinttext: "14".tr,
                        labeltext: "15".tr,
                      ),
                    ),
                    CustomButtonAuth(
                      buttontext: "26".tr,
                      onPressed: () => con.signup(),
                    ),
                    CustomTextforLogging(
                      firsttext: "27".tr,
                      secondtext: "28".tr,
                      ontap: () => Get.offNamed(AppRoute.login),
                    )
                  ],
                ),
              ),
            ),
         ),
        ),
      ),
    );
  }
}





//  "You Don't have account? "