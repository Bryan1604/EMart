import 'package:chat_app/const/colors.dart';
import 'package:chat_app/controller/home_controller.dart';
import 'package:chat_app/views/cart_screen/cart_screen.dart';
import 'package:chat_app/views/category_screen/category_screen.dart';
import 'package:chat_app/views/home_screen/home_screen.dart';
import 'package:chat_app/views/profile_creen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
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