import 'package:chat_app/gen/colors.gen.dart';
import 'package:chat_app/screens/Auth/signup_screen.dart';
import 'package:chat_app/gen/consts.dart';
import 'package:chat_app/gen/list.dart';
import 'package:chat_app/screens/Auth/auth_controller.dart';
import 'package:chat_app/widgets/applogo_widget.dart';
import 'package:chat_app/widgets/bg_widget.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:chat_app/widgets/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
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
              Obx(()=> Column(
                  children: [
                    customTextField(hint: emailHint,title: email, isPass: false, controller: emailController),
                    customTextField(hint: passwordHint, title: password,isPass: true, controller: passwordController),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){}, child: forgetPass.text.make()),
                    ),
                    5.heightBox,
                    controller.isLoading.value
                      ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(ColorName.redColor),
                      )
                      : ourButton(
                        color: ColorName.redColor,
                        title: login,
                        textColor: ColorName.whiteColor,
                        onPress: (
                        ) 
                    //     async{
                    //       controller.isLoading(true);
                    //     await controller.loginMethod(context: context, email: emailController.text, password: passwordController.text).then((value){
                    //       if(value != null ){
                    //         VxToast.show(context, msg: "Logged in successfull");
                    //         Get.to( const Home());
                    //       }
                    //       else{
                    //         // VxToast.show(context, msg: "Logged in unsuccessfull");
                    //         controller.isLoading(false);
                    //       }
                    //     }
                    //   );
                    // }
                    ).box.width(context.screenWidth-50).make(),
                    5.heightBox,
                    createNewAccount.text.color(ColorName.fontGrey).make(),
                    5.heightBox,
                    ourButton(
                      color: ColorName.lightGolden, 
                      title: "Sign up",
                      textColor: ColorName.whiteColor,
                      onPress: (){
                        Get.to(()=>const SignupScreen());
                      }
                    ).box.width(context.screenWidth-50).make(),
              
                    10.heightBox,
                    loginWith.text.color(ColorName.fontGrey).make(),
                    5.heightBox,
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: ColorName.lightGrey,
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
              ),

              
          ]),
          )
      
      ));
  }
}