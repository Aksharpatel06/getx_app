import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/utils/color.dart';

import '../../controller/quiz_controller.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // QuizController quizController = Get.find();
    QuizController quizController = Get.put(QuizController());

    return Scaffold(
      backgroundColor: boxColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  'Nice Work',
                  style: TextStyle(
                    letterSpacing: 2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                Center(
                  child: Image.asset(
                    'asset/img/quiz/Check.png',
                  ),
                ),
                Center(
                  child: Image.asset(
                    'asset/img/quiz/Star.png',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  ()=> Text(
                    'You Earned ${quizController.trueQuestion*10} pts',
                    style: const TextStyle(
                      letterSpacing: 2,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                  quizController.restartGame();
                },
                child: Container(
                  width: double.infinity,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: boxColor,
                    border: Border.all(color: countinerColor),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: countinerColor,
                        blurRadius: 32,
                        offset: const Offset(0, 16),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Text(
                    'Play Again',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: quizController.isColor.value?Colors.white:secounderyColor,
                        fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
