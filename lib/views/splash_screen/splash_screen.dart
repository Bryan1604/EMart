import 'package:chat_app/const/colors.dart';
import 'package:chat_app/widget_common/applogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

import '../auth_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // create methodo cho change screen

  changeScreen(){
    Future.delayed(Duration(seconds: 3),(){
      Get.to(() => const LoginScreen());
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
            Align(
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