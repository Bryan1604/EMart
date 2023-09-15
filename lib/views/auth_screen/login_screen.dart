import 'package:chat_app/const/colors.dart';
import 'package:chat_app/const/consts.dart';
import 'package:chat_app/const/list.dart';
import 'package:chat_app/views/auth_screen/signup_screen.dart';
import 'package:chat_app/views/home_screen/home.dart';
import 'package:chat_app/widget_common/applogo_widget.dart';
import 'package:chat_app/widget_common/bg_widget.dart';
import 'package:chat_app/widget_common/custom_textfield.dart';
import 'package:chat_app/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              "Login to app".text.white.size(18).make(),
              15.heightBox,
              Column(
                children: [
                  customTextField(hint: emailHint,title: email),
                  customTextField(hint: passwordHint, title: password),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: (){}, child: forgetPass.text.make()),
                  ),
                  5.heightBox,
                  ourButton(color: redColor,title: login,textColor: whiteColor,onPress: (){
                    Get.to(()=> const Home());
                  }).box.width(context.screenWidth-50).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(
                    color: lightGolden, 
                    title: "Sign up",
                    textColor: whiteColor,
                    onPress: (){
                      Get.to(()=>const SignupScreen());
                    }
                  ).box.width(context.screenWidth-50).make(),

                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: lightGrey,
                          radius: 25,
                          child: Image.asset(
                            socialIconList[index],
                            width: 30,
                          ),
                        ),
                      )
                      )
                  )
                ],
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-70).shadow5xl.make(),

              
          ]),
          )
      
      ));
  }
}