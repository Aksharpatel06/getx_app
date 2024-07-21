import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/view/quiz_app/screen/quiz/quiz_screen.dart';
import 'package:getx_app/view/quiz_app/screen/result/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizScreen(),
    );
  }
}
