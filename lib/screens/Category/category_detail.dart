import 'package:chat_app/gen/colors.gen.dart';
import 'package:chat_app/screens/Category/item_detail.dart';
import 'package:chat_app/widgets/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../gen/list.dart';

class CategotyDetail extends StatelessWidget {
  final String? title;
  const CategotyDetail({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.make() ,
          shadowColor: ColorName.whiteColor.withAlpha(0),
        ),
        body: Container(
            padding:const  EdgeInsets.all(12),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      6,
                      (index) => "Baby Clothing".text.color(ColorName.darkFontGrey).makeCentered().box.white.size(150, 60).margin(const EdgeInsets.all( 4)).rounded.make()),
                  ),

                ),
                10.heightBox,
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 9,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 16,crossAxisSpacing: 16,mainAxisExtent: 250), itemBuilder: (context,index){
                    return Column(
                      children: [
                        Image.asset(categoryList[index],width: 100,height: 150,fit: BoxFit.cover,),
                        10.heightBox,        
                        title!.text.color(ColorName.darkFontGrey).align(TextAlign.center).make(),
                        5.heightBox,
                        "\$600".text.color(ColorName.redColor).size(12).make()
                      ],
                      
                    ).box.white.roundedSM.clip(Clip.antiAlias).outerShadow.make().onTap(() {
                      Get.to(()=> ItemDetail(title: title,));
                    });
                  }),
                ),
              ],
            ),
        ),
      )
    );
  }
}