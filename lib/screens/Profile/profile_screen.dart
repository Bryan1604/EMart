import 'package:chat_app/gen/colors.gen.dart';
import 'package:chat_app/gen/list.dart';
import 'package:chat_app/screens/Profile/edit_profile.dart';
import 'package:chat_app/screens/Profile/profile_cotroller.dart';
import 'package:chat_app/screens/Profile/widgets/detail_card.dart';
import 'package:chat_app/widgets/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      //edit profile button
                      const Align(alignment: Alignment.topRight,child: Icon(Icons.edit, color: ColorName.whiteColor)).onTap(() {
                        controller.nameController.text = "Luong Vu";
                        controller.passController.text = "123456"; 
                        Get.to(()=> const EditProfileScreen());
                      }),
                      // Profile detail
                      Row(
                        children: [
                          Image.asset("assets/images/imgProfile.webp", width: 50,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                          10.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Luong Vu".text.white.make(),
                                "luongvuhs@gmail.com".text.white.make()
                              ],
                            )
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: ColorName.whiteColor
                              )
                            ),
                            onPressed: () async{
                              // await Get.put(AuthController()).signoutMethod(context);
                              // Get.offAll(()=> const LoginScreen());
                            }, 
                            child: "Log out".text.white.make())
                          ],
                        ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DetailsCard(count: "1", title: "in your card", width: context.screenWidth/3.2),
                          DetailsCard(count: "1", title: "in your wish list", width: context.screenWidth/3.2),
                          DetailsCard(count: "1", title: "your order", width: context.screenWidth/3.2),
                        ],
                      ),

                      40.heightBox,

                      ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index){
                          return ListTile(
                            leading: Image.asset(profileButtonIcon[index], width: 22,),
                            title: "${profileButtonList[index]}".text.color(ColorName.darkFontGrey).make(),
                          );
                        },
                        separatorBuilder: (context, index){
                          return const Divider(color: ColorName.lightGrey,);
                        },
                        itemCount: profileButtonList.length
                      ).box.white.rounded.padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make()
                    ],
                  ),
                )
              )
        // body: StreamBuilder(
        //   stream: FireStoreServices.getUser(currentUser!.email),
        //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot > snapshot){
        //     if(!snapshot.hasData){
        //       return const Center(
        //         child: CircularProgressIndicator(
        //           valueColor: AlwaysStoppedAnimation(redColor),
        //         ),
        //       );
        //     }
        //     else{
        //       var data  = snapshot.data!.docs[0];
        //       return  SafeArea(
        //         child: Container(
        //           padding: const EdgeInsets.all(8),
        //           child: Column(
        //             children: [
        //               //edit profile button
        //               const Align(alignment: Alignment.topRight,child: Icon(Icons.edit, color: whiteColor)).onTap(() {
        //                 controller.nameController.text = data['name'];
        //                 controller.passController.text = data['password'];
        //                 Get.to(()=> EditProfileScreen(data: data));
        //               }),
        //               // Profile detail
        //               Row(
        //                 children: [
        //                   data['imageUrl'] != '' 
        //                     ? Image.network(data['imageUrl'],width: 50,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make() 
        //                     : Image.asset("assets/images/imgProfile.webp", width: 50,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
        //                   10.widthBox,
        //                   Expanded(
        //                     child: Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         "${data['name']}".text.white.make(),
        //                         "${data['email']}".text.white.make()
        //                       ],
        //                     )
        //                   ),
        //                   OutlinedButton(
        //                     style: OutlinedButton.styleFrom(
        //                       side: const BorderSide(
        //                         color: whiteColor
        //                       )
        //                     ),
        //                     onPressed: () async{
        //                       await Get.put(AuthController()).signoutMethod(context);
        //                       Get.offAll(()=> const LoginScreen());
        //                     }, 
        //                     child: "Log out".text.white.make())
        //                   ],
        //                 ),
        //               20.heightBox,
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                 children: [
        //                   DetailsCard(count: "${data['cart_count']}", title: "in your card", width: context.screenWidth/3.2),
        //                   DetailsCard(count: "${data['wishlist_count']}", title: "in your wish list", width: context.screenWidth/3.2),
        //                   DetailsCard(count: "${data['order_count']}", title: "your order", width: context.screenWidth/3.2),
        //                 ],
        //               ),

        //               40.heightBox,

        //               ListView.separated(
        //                 shrinkWrap: true,
        //                 itemBuilder: (BuildContext context, int index){
        //                   return ListTile(
        //                     leading: Image.asset(profileButtonIcon[index], width: 22,),
        //                     title: "${profileButtonList[index]}".text.color(darkFontGrey).make(),
        //                   );
        //                 },
        //                 separatorBuilder: (context, index){
        //                   return const Divider(color: lightGrey,);
        //                 },
        //                 itemCount: profileButtonList.length
        //               ).box.white.rounded.padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make()
        //             ],
        //           ),
        //         )
        //       );
        //     }
        //   },
        // ),
      )
    );
  }
}