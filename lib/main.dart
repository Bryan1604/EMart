import 'package:chat_app/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:chat_app/chat_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
        // fontFamily: 
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

