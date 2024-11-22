import 'package:chat_app/gen/colors.gen.dart';
import 'package:chat_app/gen/consts.dart';
import 'package:chat_app/gen/list.dart';
import 'package:chat_app/screens/Home/home_controller.dart';
import 'package:chat_app/widgets/home_buttons.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return Container(
      // padding: const EdgeInsets.all(12),
      color: ColorName.greyBackground,
      height: context.screenHeight,
      width: context.screenWidth,
      child: SafeArea(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 16, left: 16),
            height: 50,
            color: ColorName.lightGrey,
            child: TextFormField(
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: ColorName.whiteColor,
                  hintText: searchAnything,
                  hintStyle: TextStyle(color: ColorName.textfieldGrey)),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      // autoPlay: true,
                      height: 200,
                      enlargeCenterPage: true,
                      itemCount: sliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          sliderList[index],
                          fit: BoxFit.fitWidth,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      }),

                  10.heightBox,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        2,
                        (index) => HomeButtons(
                              height: context.screenHeight / 8,
                              width: context.screenWidth / 2.5,
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
                      itemBuilder: (context, index) {
                        return Image.asset(
                          sliderList[index],
                          fit: BoxFit.fitWidth,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      }),

                  15.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        3,
                        (index) => HomeButtons(
                              height: context.screenHeight / 8,
                              width: context.screenWidth / 4,
                              icon: index == 0
                                  ? icCategory
                                  : index == 1
                                      ? icBrand
                                      : icTopSeller,
                              title: index == 0
                                  ? topCategory
                                  : index == 1
                                      ? brand
                                      : topSellers,
                            )),
                  ),

                  10.heightBox,
                  Align(
                    alignment: Alignment.topLeft,
                    child: featureCategories.text
                        .color(ColorName.darkFontGrey)
                        .size(18)
                        .make(),
                  ),
                  20.heightBox,

                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(color: ColorName.redColor),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Featured Product".text.white.size(18).make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  6,
                                  (index) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            "assets/images/ao1.jpeg",
                                            width: 150,
                                            fit: BoxFit.cover,
                                          ),
                                          10.heightBox,
                                          "Jacket XXL"
                                              .text
                                              .color(ColorName.darkFontGrey)
                                              .make(),
                                          10.heightBox,
                                          "\$600"
                                              .text
                                              .color(ColorName.redColor)
                                              .size(16)
                                              .make()
                                        ],
                                      )
                                          .box
                                          .white
                                          .roundedSM
                                          .padding(const EdgeInsets.all(8))
                                          .margin(const EdgeInsets.all(4))
                                          .make()),
                            ),
                          ),
                          10.heightBox
                        ]),
                  ),

                  20.heightBox,
                  Container(
                    height: 250,
                    decoration: const BoxDecoration(color: ColorName.lightGrey),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text("LIVE SIEU RE",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorName.redColor,
                                )),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: const Row(
                                children: [
                                  Text("Xem tat them",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: ColorName.fontGrey,
                                      )),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        8.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              6,
                              (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Obx(
                                  () => Stack(
                                    children: [
                                      controller.chewieController != null
                                          ? Chewie(
                                              controller:
                                                  controller.chewieController!)
                                          : const Image(
                                              image: AssetImage(
                                                  "assets/images/ao1.jpeg"),
                                              width: 150,
                                              fit: BoxFit.cover),

                                      const Positioned(
                                        top: 8, // Khoảng cách từ trên cùng
                                        left: 8, // Khoảng cách từ bên trái
                                        child: Text(
                                          "Live",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 195, 68, 68),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                        ),
                                      ),
                                      // Phần tử phía dưới
                                      const Positioned(
                                        bottom: 8, // Khoảng cách từ dưới cùng
                                        left: 8, // Khoảng cách từ bên trái
                                        child: Text(
                                          "DAI TIEC VOUCHER",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                  // 2nd sw iper
                  VxSwiper.builder(
                      //aspectRatio: 5/3,
                      //   autoPlay: true,
                      height: 180,
                      enlargeCenterPage: true,
                      itemCount: sliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          sliderList[index],
                          fit: BoxFit.fitWidth,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      }),

                  //all product sections

                  20.heightBox,
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 300),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            10.heightBox,
                            Image.asset(
                              "assets/images/ao1.jpeg",
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            const Spacer(),
                            "Jacket XXL"
                                .text
                                .color(ColorName.darkFontGrey)
                                .make(),
                            10.heightBox,
                            "\$600"
                                .text
                                .color(ColorName.redColor)
                                .size(16)
                                .make(),
                            10.heightBox,
                          ],
                        ).box.white.roundedSM.make();
                      }).marginSymmetric(horizontal: 12)
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
