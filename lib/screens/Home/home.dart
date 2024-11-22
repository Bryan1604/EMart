import 'package:chat_app/gen/colors.gen.dart';
import 'package:chat_app/screens/Cart/cart_screen.dart';
import 'package:chat_app/screens/Category/category_screen.dart';
import 'package:chat_app/screens/Home/home_screen.dart';
import 'package:chat_app/screens/Profile/profile_screen.dart';
import 'package:chat_app/screens/Home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navBarItem = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
      const BottomNavigationBarItem(icon: Icon(Icons.category), label: ""),
      const BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: ""),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
    ];

    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Obx(() => Expanded(
                child: navBody.elementAt(controller.currentnNavIndex.value))),
          ],
        ),
        Obx(() => Positioned(
              left: controller.currentPosition.value.dx,
              top: controller.currentPosition.value.dy,
              child: Draggable<int>(
                data: 1,
                feedback: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: ColorName.redColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Icon(Icons.star, color: Colors.white),
                ),
                childWhenDragging: Container(),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: ColorName.redColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Icon(Icons.star, color: Colors.white),
                ),
                onDraggableCanceled: (velocity, offset) {
                  // Update the position of the draggable widget
                  controller.currentPosition.value = offset;
                },
                onDragUpdate: (details) {
                  // Update the position of the draggable widget
                  print(details.globalPosition);
                },
              ),
            ))
      ]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            selectedItemColor: ColorName.redColor,
            currentIndex: controller.currentnNavIndex.value,
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorName.whiteColor,
            items: navBarItem,
            onTap: (value) {
              controller.currentnNavIndex.value = value;
            }),
      ),
    );
  }
}
