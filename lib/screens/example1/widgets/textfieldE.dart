import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {required this.controller,
      required this.type,
      required this.hinttext,
      required this.valid});

  TextEditingController controller;
  TextInputType type;
  String hinttext;
  String Function(String?) valid;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return TextFormField(
      validator: valid,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical(y: -0.10),
      keyboardType: type,
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.grey,
        decoration: TextDecoration.none,
      ),
      controller: controller,
      decoration: InputDecoration(
          // errorText: "Please eneter something",
          hintText: hinttext,
          hintStyle: TextStyle(
              // decoration:PostFilledField
              color: theme.hintColor),
          // fillColor: Theme.of(context).,

          contentPadding: EdgeInsets.all(12),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Colors.white,
              width: 3.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: InputBorder.none),
    );
  }
}
