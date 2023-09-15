import 'package:chat_app/const/colors.dart';
import 'package:chat_app/const/list.dart';
import 'package:chat_app/views/category_screen/category_detail.dart';
import 'package:chat_app/widget_common/bg_widget.dart';
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
          shadowColor: whiteColor.withAlpha(0),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 200), itemBuilder: (context,index){
            return Column(
              children: [
                Image.asset(categoryList[index],width: 100,height: 150,fit: BoxFit.cover,),
                10.heightBox,        
                categoryTitleList[index].text.color(darkFontGrey).align(TextAlign.center).make()
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