import 'package:flutter/material.dart';
import 'package:chat_app/const/colors.dart';
import 'package:velocity_x/velocity_x.dart';
Widget DetailsCard({width,String? count, String? title}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        count!.text.color(darkFontGrey).size(16).make(),
        5.heightBox,
        title!.text.color(darkFontGrey).size(16).make(),
        ],
      ).box.white.rounded.width(width).height(70).padding(const EdgeInsets.all(4)).make();
              
}