// import 'package:chat_app/const/firebase_const.dart';
import 'package:chat_app/gen/colors.gen.dart';
import 'package:chat_app/screens/Auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../gen/consts.dart';
// import '../../const/list.dart';
import '../../widgets/applogo_widget.dart';
import '../../widgets/bg_widget.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isChecked = false;
  var controller = Get.put(AuthController());
  //Text controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Column(children: [
                (context.screenHeight * 0.1).heightBox,
                applogoWidget(),
                15.heightBox,
                "Sign up to app".text.white.size(18).make(),
                15.heightBox,
                Obx(
                  () => Column(
                    children: [
                      customTextField(
                          hint: nameHint,
                          title: name,
                          controller: nameController,
                          isPass: false),
                      customTextField(
                          hint: emailHint,
                          title: email,
                          controller: emailController,
                          isPass: false),
                      customTextField(
                          hint: passwordHint,
                          title: password,
                          controller: passwordController,
                          isPass: true),
                      customTextField(
                          hint: passwordHint,
                          title: retypePassword,
                          controller: passwordRetypeController,
                          isPass: true),
                      10.heightBox,
                      Row(
                        children: [
                          Checkbox(
                              activeColor: ColorName.redColor,
                              checkColor: ColorName.whiteColor,
                              value: isChecked,
                              onChanged: (newValue) {
                                setState(() {
                                  isChecked = newValue;
                                });
                              }),
                          5.heightBox,
                          Expanded(
                            child: RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                    color: ColorName.fontGrey,
                                  )),
                              TextSpan(
                                  text: termAndCond,
                                  style: TextStyle(color: ColorName.redColor)),
                              TextSpan(
                                  text: " and ",
                                  style: TextStyle(
                                    color: ColorName.fontGrey,
                                  )),
                              TextSpan(
                                  text: privacyPolicy,
                                  style: TextStyle(color: ColorName.redColor))
                            ])),
                          )
                        ],
                      ),
                      5.heightBox,
                      controller.isLoading.value
                          ? const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation(ColorName.redColor),
                            )
                          : ourButton(
                              color: isChecked == true
                                  ? ColorName.redColor
                                  : ColorName.lightGrey,
                              title: signup,
                              textColor: ColorName.whiteColor,
                              onPress: () async {
                                if (isChecked != false) {
                                  controller.isLoading(true);
                                  // try{
                                  //   await controller.signupMethod(context: context, email: emailController.text, password: passwordController.text).then((value){
                                  //     return controller.storeUserData(
                                  //       email: emailController.text,
                                  //       password: passwordController.text,
                                  //       name: nameController.text );
                                  //   }).then((value){
                                  //     VxToast.show(context, msg: "Logged in successfull");
                                  //     Get.offAll(()=>const Home());
                                  //   });
                                  // }catch(e){
                                  //   auth.signOut();
                                  //   VxToast.show(context, msg: e.toString());
                                  //   controller.isLoading(false);
                                  // }
                                }
                              }).box.width(context.screenWidth - 50).make(),
                      5.heightBox,
                      RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(color: ColorName.fontGrey)),
                          TextSpan(
                              text: "Log in", style: TextStyle(color: ColorName.redColor))
                        ]),
                      ).onTap(() {
                        Get.back();
                      })
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .padding(const EdgeInsets.all(16))
                      .width(context.screenWidth - 70)
                      .shadow5xl
                      .make(),
                ),
              ]),
            )));
  }
}
