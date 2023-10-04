import 'package:chat_app/const/colors.dart';
import 'package:chat_app/const/firebase_const.dart';
import 'package:chat_app/widget_common/applogo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

import '../auth_screen/login_screen.dart';
import '../home_screen/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // create methodo cho change screen

  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      // Get.to(() => const LoginScreen());
      
      auth.authStateChanges().listen((User? user) {
        if(user == null && mounted){
           Get.to(() => const LoginScreen());
        }else{
          Get.to(()=>const Home());
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    changeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body:  Center(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.center,
              child: SizedBox(height: 300,),
            ),
            applogoWidget(),
            10.heightBox,
          ],
        )),
    );
  }
}