import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const/colors.dart';
import '../../const/consts.dart';
import '../../const/list.dart';
import '../../widget_common/applogo_widget.dart';
import '../../widget_common/bg_widget.dart';
import '../../widget_common/custom_textfield.dart';
import '../../widget_common/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(  
          child: Column(
            children: [
              (context.screenHeight*0.1).heightBox,
              applogoWidget(),
              15.heightBox,
              "Sign up to app".text.white.size(18).make(),
              15.heightBox,
              Column(
                children: [
                  customTextField(hint: nameHint,title: name),
                  customTextField(hint: emailHint,title: email),
                  customTextField(hint: passwordHint, title: password),
                  customTextField(hint: passwordHint, title: retypePassword),
                 
                  10.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        activeColor: redColor, 
                        checkColor: whiteColor,
                        value: isChecked, 
                        onChanged: (newValue) {
                          setState(() {
                            isChecked = newValue;
                          });
                        }
                      ),
                      5.heightBox,
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "I agree to the ",
                                style: TextStyle(
                                  color: fontGrey,
                                )
                              ),
                              TextSpan(
                                text: termAndCond,
                                style: TextStyle(
                                  color: redColor
                                )
                              ),
                              TextSpan(
                                text: " and ",
                                style: TextStyle(
                                  color: fontGrey,
                                )
                              ),
                              TextSpan(
                                text: privacyPolicy,
                                style: TextStyle(
                                  color: redColor
                                )
                              )
                            ]
                          )
                        ),
                      )
                    ],
                  ),

                  5.heightBox,
                  ourButton(color: isChecked == true? redColor: lightGrey,title: signup,textColor: whiteColor,onPress: (){}).box.width(context.screenWidth-50).make(),
                  5.heightBox,
                  
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: fontGrey)
                        ),
                        TextSpan(
                          text: "Log in",
                          style: TextStyle(color: redColor)
                        )
                      ]
                    ),
                  ).onTap(() {
                    Get.back();
                   })
                
                 
                ],
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-70).shadow5xl.make(),

              
          ]),
          )
      
      ));
  }
}