
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handling_view.dart';
import '../../../core/constant/appcolor.dart';
import '../../../core/functions/exit_alert.dart';
import '../../../core/functions/validinput.dart';
import '../../widgets/auth/custombodyauth.dart';
import '../../widgets/auth/custombuttonauth.dart';
import '../../widgets/auth/customlogtext.dart';
import '../../widgets/auth/customtextform.dart';
import '../../widgets/auth/customtitleauth.dart';
import '../../widgets/auth/logoauth.dart';

class Login extends StatelessWidget {

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColor.background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primarycolor,
        onPressed: () {Get.defaultDialog(
              title: "Attention", middleText: "Test Account \n email : testuser@gmail.com \n password : 123456789 ");},child: Icon(Icons.info,color: Colors.white,)),
      appBar: AppBar(
        backgroundColor: AppColor.background,
        centerTitle: true,
        title: Text(
          "9".tr,
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
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => 
          HandelingViewReq(
            statusResponse: controller.status,
            widget: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: Form(
                key: controller.formkey,
                child: ListView(
                  
                  
                  children: [
                    LogoAuth(),
                     SizedBox(height: 30.h),
                    CustomTitleAuth(title: "10".tr),
                     SizedBox(height: 20.h),
                    CustomBodyAuth(bodytext: "11".tr),
                     SizedBox(height: 60.h),
                    CustomTextForm(
                      isnumber: false,
                      valid: (value) {
                        return validinput(value!, 12, 100, "email");
                      },
                      textController: controller.email,
                      icon: Icons.mail,
                      hinttext: "12".tr,
                      labeltext: "13".tr,
                    ),
                     SizedBox(height: 30.h),
                    GetBuilder<LoginControllerImp>(
                      builder: (controller) => CustomTextForm(
                        ontapicon: () => controller.showpassword(),
                        secure: controller.showpass,
                        isnumber: false,
                        valid: (value) {
                          return validinput(value!, 8, 30, "password");
                        },
                        textController: controller.password,
                        icon: Icons.lock,
                        hinttext: "14".tr,
                        labeltext: "15".tr,
                      ),
                    ),
                    InkWell(
                        onTap: () => controller.gotoforgetpassword(),
                        child: Text("16".tr,
                            textAlign: TextAlign.end,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 12.sp))),
                    CustomButtonAuth(
                      buttontext: "17".tr,
                      onPressed: () => controller.Login(),
                    ),
                    CustomTextforLogging(
                      firsttext: "18".tr,
                      secondtext: "19".tr,
                      ontap: () => controller.gotosignup(),
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