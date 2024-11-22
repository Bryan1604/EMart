import 'package:chat_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
Widget DetailsCard({width,String? count, String? title}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
      children: [
        count!.text.color(ColorName.darkFontGrey).size(16).make(),
        5.heightBox,
        title!.text.color(ColorName.darkFontGrey).size(16).align(TextAlign.center).make(),
        ],
      ).box.white.rounded.width(width).padding(const EdgeInsets.all(4)).height(85).shadow.make();
              
}