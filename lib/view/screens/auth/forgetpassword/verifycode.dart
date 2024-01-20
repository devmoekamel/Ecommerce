
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpass/verifycode_controller.dart';
import '../../../../core/class/handling_view.dart';
import '../../../../core/constant/appcolor.dart';
import '../../../../core/constant/approute.dart';
import '../../../widgets/auth/custombodyauth.dart';
import '../../../widgets/auth/customtitleauth.dart';

class VerifyCode extends StatelessWidget {

  VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        centerTitle: true,
        title: Text(
         "38".tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
        elevation: 0.0,
      ),
      body: GetBuilder<VerifyCodeControllerImp>(
        builder: (controller) =>
          HandelingViewReq(
            statusResponse: controller.status,
            widget: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            child: ListView(
              children: [
                CustomTitleAuth(title: "39".tr),
                 SizedBox(height: 20.h),
                CustomBodyAuth(
                  bodytext: "40".tr,
                ),
                 SizedBox(height: 50.h),
                OtpTextField(
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(15),
                  numberOfFields: 5,
                  // focusedBorderColor: Color.fromARGB(255, 63, 27, 147),
                  borderColor: Color.fromARGB(255, 63, 27, 147),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) =>controller.checkCode(verificationCode), // end onSubmit
                ),
                // const SizedBox(height: 30),
              ],
            ),
                    ),
          ),
      ),
    );
  }
}

class CustomOTP extends StatelessWidget {
  const CustomOTP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      fieldWidth: 50.0,
      borderRadius: BorderRadius.circular(15),
      numberOfFields: 5,
      // focusedBorderColor: Color.fromARGB(255, 63, 27, 147),
      borderColor: Color.fromARGB(255, 63, 27, 147),
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      //runs when every textfield is filled
      onSubmit: (String verificationCode) {
        Get.toNamed(AppRoute.resetpassword);
      }, // end onSubmit
    );
  }
}

//  "You Don't have account? "
