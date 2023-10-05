import 'dart:io';

import 'package:chat_app/const/colors.dart';
import 'package:chat_app/const/consts.dart';
// import 'package:chat_app/const/firebase_const.dart';
import 'package:chat_app/controller/profile_cotroller.dart';
import 'package:chat_app/widget_common/bg_widget.dart';
import 'package:chat_app/widget_common/custom_textfield.dart';
import 'package:chat_app/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    var controller = Get.find<ProfileController>();
    // controller.nameController.text = data['name'];
    // controller.passController.text = data['password'];
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Obx(()=>Column(
            mainAxisSize: MainAxisSize.min,
            children: [ 
              data['imageUrl'] == '' && controller.profileImgPath.isEmpty 
              ? Image.asset("assets/images/imgProfile.webp", width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make() 
              : 
              data['imageUrl'] != controller.profileImgPath.isEmpty
                ? Image.network(data['imageUrl'],width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                : Image.file(
                    File(controller.profileImgPath.value),
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ourButton(
                color: redColor,
                onPress: (){
                  controller.changeImage(context);
                },
                textColor: whiteColor,
                title: "Change"
                ),
              const Divider(),
              20.heightBox,
              customTextField(controller: controller.nameController,hint: nameHint, title: name, isPass: false),
              customTextField(controller: controller.oldpassController,hint: nameHint, title: "Old password", isPass: true),
              customTextField(controller: controller.newpassController,hint: password, title: "New password", isPass: true),
              20.heightBox,
              controller.isLoading.value 
                ? const CircularProgressIndicator(
                    valueColor:  AlwaysStoppedAnimation(redColor) ,
                  )
                : SizedBox(
                    width: context.screenWidth-60,
                    child: ourButton(
                      color: redColor,
                      textColor: whiteColor,
                      title: "Save",
                      onPress: ()async{
                        controller.isLoading(true);
                        // await controller.getToken();

                        //if image is not selected
                        if(controller.profileImgPath.value.isNotEmpty){
                          await controller.uploadProfileImage();
                        }else{
                          controller.profileImageLink = data['imageUrl'];
                        }

                        if(data['password'] == controller.oldpassController.text){
                          await controller.changeAuthPassword(
                            email: data['email'],
                            password: controller.oldpassController.text,
                            newpassword: controller.newpassController.text,
                          );
                          await controller.updateProfile( 
                            name : controller.nameController.text,
                            password: controller.newpassController.text, 
                            imgUrl: controller.profileImageLink
                          );
                          showSimpleNotification(
                            const Text("Update profile success!"),
                            background: Colors.green
                          );
                        }else{
                          showSimpleNotification(
                            const Text("Update profile fail!"),
                            background: Colors.red
                          );
                          controller.isLoading(false);
                        }
                        
                        
                      } 
                    ),
                  )
          ]).box.white.shadow5xl.padding(const EdgeInsets.all(16)).margin(const EdgeInsets.only(left: 12, right: 12)).rounded.make(),
        )
      )
    );
  }
}