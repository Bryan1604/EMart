import 'package:chat_app/const/colors.dart';
import 'package:chat_app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navBarItem = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
      BottomNavigationBarItem(icon: Icon(Icons.category), label: ""),
      BottomNavigationBarItem(icon: Icon(Icons.card_travel ), label: ""),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
    ];

    var navBody  = [
      Container(color: Colors.amber,),
      Container(color: Colors.blue,),
      Container(color: Colors.green,),
      Container(color: Colors.redAccent,),
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(()=>Expanded(child: navBody.elementAt(controller.currentnNavIndex.value))),
        ],
      ),

      bottomNavigationBar:Obx(()=>
       BottomNavigationBar(
        selectedItemColor: redColor,
        currentIndex: controller.currentnNavIndex.value,
        type: BottomNavigationBarType.fixed,
        backgroundColor: whiteColor,
        items: navBarItem,
        onTap: (value){
          controller.currentnNavIndex.value = value;
        }),
        ),
    );
  }
}