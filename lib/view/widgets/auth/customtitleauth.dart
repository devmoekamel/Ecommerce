import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CustomTitleAuth extends StatelessWidget {
    String title ;
   CustomTitleAuth({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Text(
            title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            );
  }
}