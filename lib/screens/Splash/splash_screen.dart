import 'package:chat_app/gen/colors.gen.dart';
import 'package:chat_app/screens/Home/home.dart';
import 'package:chat_app/widgets/applogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

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
      Get.to(() => const Home());
      // auth.authStateChanges().listen((User? user) {
      //   if(user == null && mounted){
      //      Get.to(() => const LoginScreen());
      //   }else{
      //     Get.to(()=>const Home());
      //   }
      // });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.redColor,
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