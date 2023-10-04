import 'package:chat_app/const/colors.dart';
import 'package:chat_app/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetail extends StatelessWidget {
  final String? title;
  const ItemDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).make(),
        actions: [
            IconButton(onPressed: (){}, icon:const Icon(Icons.share)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline))
        ],
        shadowColor: whiteColor.withAlpha(0),
      ),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                    // autoPlay: true,
                    height: 250,
                    aspectRatio: 16/9,
                    itemCount: 3,
                    itemBuilder: (context,index){
                    return Image.asset("assets/images/giay1.jpeg", width: double.infinity,fit: BoxFit.cover,);
                  }),

                  10.heightBox,
                  // titile and detail section
                  title!.text.size(16).color(darkFontGrey).make(),
                  10.heightBox,
                  VxRating(
                    onRatingUpdate: (value){},
                    normalColor: textfieldGrey,
                    selectionColor: const Color.fromARGB(255, 247, 228, 63),
                    count: 5,
                    size: 25,
                    stepInt: true,
                  ),

                  10.heightBox,
                  "\$30,000".text.color(redColor).size(18).make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Seller".text.white.make(),
                          5.heightBox,
                          "In House Brands".text.color(darkFontGrey).size(16).make()
                        ],
                      )),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.message_rounded),
                      )
                    ],
                  ).box.height(60).padding(const EdgeInsets.symmetric(horizontal: 16)).color(textfieldGrey).make(),

                // color selections
                5.heightBox,
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Color: ".text.color(textfieldGrey).make(),
                        ),
                        Row(
                          children: List.generate(3, (index) => VxBox().size(30, 30).roundedFull.color(Vx.randomPrimaryColor).margin(const EdgeInsets.symmetric(horizontal: 4)).make()),
                        )
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),

                    // quntity row
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Quantity : ".text.color(textfieldGrey).make(),
                        ),
                        Row(
                          children: [
                            IconButton(onPressed: (){}, icon: const Icon(Icons.remove)),
                            "0".text.size(16).color(darkFontGrey).make(),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                            5.heightBox,
                            "(0 available)".text.color(textfieldGrey).make(),

                          ]
                        )
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),

                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Quantity : ".text.color(textfieldGrey).make(),
                        ),
                        Row(
                          children: [
                            IconButton(onPressed: (){}, icon: const Icon(Icons.remove)),
                            "0".text.size(16).color(darkFontGrey).make(),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                            5.heightBox,
                            "(0 available)".text.color(textfieldGrey).make(),

                          ]
                        )
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),
                  ],
                ).box.white.shadowSm.make()

              ]),
            ),
            )
        ,),

        SizedBox(
          width: double.infinity,
          height: 60,
          child: ourButton(color: redColor, onPress: (){}, textColor: whiteColor, title: "Item1"),
        ),
      ],)
    );
  }
}