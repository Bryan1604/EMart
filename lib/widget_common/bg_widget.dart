import 'package:chat_app/const/colors.dart';
import 'package:chat_app/const/consts.dart';
import 'package:flutter/material.dart';

Widget bgWidget({Widget? child}){
  return Container(
    decoration: const BoxDecoration(
      color: whiteColor,
      image: DecorationImage(
        image: AssetImage(imgBackground),
        fit: BoxFit.fitWidth ,
        alignment: Alignment.topCenter,
        )
    ),
    child: child
  );
}