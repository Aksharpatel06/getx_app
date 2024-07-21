import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/view/login_app/screen/login_screen.dart';
import 'package:getx_app/view/todo_app/screen/todo/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
