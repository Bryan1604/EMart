import 'package:chat_app/gen/colors.gen.dart';
import 'package:chat_app/screens/Category/category_detail.dart';
import 'package:chat_app/gen/list.dart';
import 'package:chat_app/widgets/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar:AppBar(
          title:"Categories".text.white.make(),
          shadowColor: ColorName.whiteColor.withAlpha(0),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 200), itemBuilder: (context,index){
            return Column(
              children: [
                Image.asset(categoryList[index],width: 100,height: 150,fit: BoxFit.cover,),
                10.heightBox,        
                categoryTitleList[index].text.color(ColorName.darkFontGrey).align(TextAlign.center).make()
              ],
              
            ).box.white.rounded.clip(Clip.antiAlias).outerShadow.make().onTap(() {
              Get.to(()=> CategotyDetail(title: categoryTitleList[index]));
            });
          }),
        ), 
      )
    );
  }
}