import 'package:chat_app/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customTextField({String? title, String? hint, controller}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).size(16).make(),
      10.heightBox,
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: textfieldGrey,
          ),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: redColor))
        )
      ),
      10.heightBox
    ],
  );
}