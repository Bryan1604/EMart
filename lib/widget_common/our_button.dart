import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget ourButton( {color, onPress,textColor,String? title }){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPress,
    child: title!.text.color(textColor).make());
}