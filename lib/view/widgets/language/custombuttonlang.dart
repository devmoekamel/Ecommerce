import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class CustomButtonLang extends StatelessWidget {
 final void Function()? onPressed ;
 final String buttontext ;
  const CustomButtonLang({ super.key,required this.onPressed,required this.buttontext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Container(
        width: double.infinity,
        child: MaterialButton(
          onPressed: onPressed,
          color: AppColor.primarycolor,
          textColor: Colors.white,
          child: Text(
            buttontext,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
