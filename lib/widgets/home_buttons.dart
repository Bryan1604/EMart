import 'package:chat_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


  @override
  Widget HomeButtons({width, height, icon, String? title, onPress }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon,width: 30 ,),
            10.heightBox,
            title!.text.color(ColorName.darkFontGrey).size(12).make()
          ],
        ).box.rounded.white.size(width, height).shadow.make();
  }
