import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CustomTextForm extends StatelessWidget {
    String ? labeltext ;
    String? Function(String?)? valid ;
    IconData ? icon ;
    String ? hinttext;
    TextEditingController ? textController ;
    bool isnumber ;
    bool ? secure ;
    void Function()? ontapicon ;
   CustomTextForm({super.key,required this.labeltext,
                  required this.hinttext,
                  required this.icon,
                 required this.textController,
                 required this.valid,
                 required this.isnumber,
                 this.ontapicon,
                 this.secure});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: secure==null||secure==false?false:true,
          keyboardType: isnumber?const TextInputType.numberWithOptions(decimal:true):TextInputType.text,
          validator:valid ,
          style:const TextStyle(fontWeight: FontWeight.bold),
            controller: textController,
            decoration: InputDecoration(
            suffixIcon: InkWell(child: Icon(icon),onTap:ontapicon ,),
              label: Text(labeltext!),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.all(15)
              ,
              hintText: hinttext,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25)
              )
            
            ),
           );
  }
}