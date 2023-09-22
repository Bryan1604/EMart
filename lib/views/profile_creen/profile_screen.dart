import 'package:chat_app/const/colors.dart';
import 'package:chat_app/const/list.dart';
import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/views/auth_screen/login_screen.dart';
import 'package:chat_app/views/profile_creen/components/detail_card.dart';
import 'package:chat_app/widget_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                //edit profile button
                const Align(alignment: Alignment.topRight,child: const Icon(Icons.edit, color: whiteColor)).onTap(() {
                  
                }),
                // Profile detail
                Row(children: [
                  Image.asset("assets/images/imgProfile.webp", width: 50,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Vu Duc Luong".text.white.make(),
                        "luongp@gmail.com".text.white.make()
                      ],
                    )
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: whiteColor
                      )
                    ),
                    onPressed: () async{
                      await Get.put(AuthController()).signoutMethod(context);
                      Get.offAll(()=> LoginScreen());
                    }, 
                    child: "Log out".text.white.make())
                ],),

                20.heightBox,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DetailsCard(count: "00", title: "in your card", width: context.screenWidth/3.2),
                    DetailsCard(count: "00", title: "in your wish list", width: context.screenWidth/3.2),
                    DetailsCard(count: "00", title: "your order", width: context.screenWidth/3.2),
                  ],
                ),

                40.heightBox,

                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      leading: Image.asset(profileButtonIcon[index], width: 22,),
                      title: "${profileButtonList[index]}".text.color(darkFontGrey).make(),
                    );
                  },
                  separatorBuilder: (context, index){
                    return const Divider(color: lightGrey,);
                  },
                  itemCount: profileButtonList.length
                ).box.white.rounded.padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make()
              ],
            ),
          )
          ),
      )
    );
  }
}