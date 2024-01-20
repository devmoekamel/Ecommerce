
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarHome extends StatelessWidget {
  final String hinttext;
  final void Function()? onPressedsearch;
  // final void Function()? onPressedicon;
  final void Function()? onPressedfav;
  void Function(String)? onChanged;
  TextEditingController textcontroller ;
   CustomAppBarHome({
    super.key,
    required this.hinttext,
    this.onPressedsearch,
    // this.onPressedicon,
    required this.onPressedfav,
    this.onChanged,
    required this.textcontroller
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: textcontroller,
              onChanged:onChanged ,
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: onPressedsearch,
                  ),
                  hintText: hinttext,
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none)),
            ),
          ),
           SizedBox(width: 8.w),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 8),
          //   decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       borderRadius: BorderRadius.circular(15)),
          //   width: 60,
          //   padding: EdgeInsets.symmetric(vertical: 8),
          //   child: IconButton(
          //       onPressed: onPressedicon,
          //       icon: Icon(
          //         Icons.notifications,
          //         size: 30,
          //         color: Colors.grey[600],
          //       )),
          // ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15)),
            width: 60.w,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
                onPressed: onPressedfav,
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 30.sp,
                  color: Colors.grey[600],
                )),
          )
        ],
      ),
    );
  }
}
