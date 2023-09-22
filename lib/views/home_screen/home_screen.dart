import 'package:chat_app/const/colors.dart';
import 'package:chat_app/const/consts.dart';
import 'package:chat_app/const/list.dart';
import 'package:chat_app/widget_common/home_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(12),
      color: lightGrey,
      height: context.screenHeight,
      width: context.screenWidth,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right:16,left: 16),
              height:50, 
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchAnything,
                  hintStyle: TextStyle(color: textfieldGrey)
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                      aspectRatio: 16/9,
                      // autoPlay: true,
                      height: 200,
                      enlargeCenterPage: true,
                      itemCount: sliderList.length,
                      itemBuilder: (context,index){
                        return Image.asset(
                            sliderList[index],
                            fit: BoxFit.fitWidth,
                        ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal:8 )).make();
                    }),
                  
                    10.heightBox,
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(2, (index) => HomeButtons(
                        height: context.screenHeight/8,
                        width: context.screenWidth/2.5,
                        icon: index == 0 ? icTodayDeal : icFlashDeal,
                        title: index == 0 ? todayDeal : flashsale,
                      )),
                    ),
                  
                    10.heightBox, 
                    // 2nd sw iper
                    VxSwiper.builder(
                      //aspectRatio: 5/3,
                      //   autoPlay: true,
                      height: 180,
                      enlargeCenterPage: true,
                      itemCount: sliderList.length,
                      itemBuilder: (context,index){
                        return Image.asset(
                            sliderList[index],
                            fit: BoxFit.fitWidth,
                        ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal:8 )).make();
                    }),
                  
                    15.heightBox, 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(3, (index) => HomeButtons(
                        height: context.screenHeight/8,
                        width: context.screenWidth/4,
                        icon: index == 0 ? icCategory : index == 1? icBrand : icTopSeller ,
                        title: index == 0 ? topCategory : index == 1? brand : topSellers,
                      )),
                    ),  

                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: featureCategories.text.color(darkFontGrey).size(18).make(),
                    )  ,    
                    20.heightBox,

                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(color: redColor ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        "Featured Product".text.white.size(18).make(),
                        10.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(6, (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("assets/images/ao1.jpeg", width: 150, fit: BoxFit.cover,),
                                10.heightBox,
                                "Jacket XXL".text.color(darkFontGrey).make(),
                                10.heightBox,
                                "\$600".text.color(redColor).size(16).make()
                              ],
                            ).box.white.roundedSM.padding(EdgeInsets.all(8)).margin(EdgeInsets.all(4)).make()),
                          ),
                        ),
                        10.heightBox

                      ]),
                    ),

                    20.heightBox, 
                    // 2nd sw iper
                    VxSwiper.builder(
                      //aspectRatio: 5/3,
                      //   autoPlay: true,
                      height: 180,
                      enlargeCenterPage: true,
                      itemCount: sliderList.length,
                      itemBuilder: (context,index){
                        return Image.asset(
                            sliderList[index],
                            fit: BoxFit.fitWidth,
                        ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal:8 )).make();
                    }),

                    //all product sections

                    20.heightBox,
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 300
                      ), 
                      itemBuilder: (context,index){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            10.heightBox,
                            Image.asset("assets/images/ao1.jpeg", width: 200,height: 200, fit: BoxFit.cover,),
                            const Spacer(),
                            "Jacket XXL".text.color(darkFontGrey).make(),
                            10.heightBox,
                            "\$600".text.color(redColor).size(16).make(),
                            10.heightBox,
                          ],
                        ).box.white.roundedSM.make();
                    }).marginSymmetric(horizontal: 12)


                  ],
                ),
              ),
            )  
          ],
        )
      ),

    );
  }
}