import 'package:chat_app/gen/colors.gen.dart';
import 'package:chat_app/gen/consts.dart';
import 'package:flutter/material.dart';

Widget bgWidget({Widget? child}){
  return Container(
    decoration: const BoxDecoration(
      color: ColorName.whiteColor,
      image: DecorationImage(
        image: AssetImage(imgBackground),
        fit: BoxFit.fitWidth ,
        alignment: Alignment.topCenter,
        )
    ),
    child: child
  );
}