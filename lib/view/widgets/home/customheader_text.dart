import 'package:flutter/material.dart';

class CustomHeaderText extends StatelessWidget {
  final String text ;
   CustomHeaderText({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text,
          style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold) ,),
      ],
    );
  }
}


