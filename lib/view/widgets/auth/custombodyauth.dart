// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomBodyAuth extends StatelessWidget {
    String bodytext ;
   CustomBodyAuth({super.key,required this.bodytext});
  @override
  Widget build(BuildContext context) {
    return    Container(
              // padding:const EdgeInsets.symmetric(horizontal:10),
              child: Text(
               bodytext,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
    );
  }
}