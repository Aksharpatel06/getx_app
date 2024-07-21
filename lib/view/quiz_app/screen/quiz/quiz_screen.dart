import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/utils/color.dart';
import 'package:getx_app/utils/quiz_list.dart';
import 'package:getx_app/view/quiz_app/controller/quiz_controller.dart';
import 'package:getx_app/view/quiz_app/screen/result/result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuizController quizController = Get.put(QuizController());

    return Obx(
      () => Scaffold(
        backgroundColor: boxColor,
        appBar: AppBar(
          backgroundColor: boxColor,
          centerTitle: true,
          title: const Text('Quiz App'),
          leading: const Icon(Icons.menu),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(Icons.more_vert),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              LinearProgressIndicator(
                backgroundColor: countinerColor,
                value: quizController.questionIndex.value / 10,
                borderRadius: BorderRadius.circular(5),
                minHeight: 5,
                color: primaryColor,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          questions[quizController.questionIndex.value]
                              .questionText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: primaryColor),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 150,
                        padding: const EdgeInsets.all(10),
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFB184),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'asset/img/quiz/Pencil.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 450,
                child: ListView.builder(
                  itemCount: questions[quizController.questionIndex.value]
                      .options
                      .length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      if (!quizController.isColor.value) {
                        quizController.selectIndex.value = index;
                        quizController.isColor.value = true;

                        if (index ==
                            questions[quizController.questionIndex.value]
                                .correctOptionIndex) {
                          quizController.rightAnswer();
                        } else if (quizController.limitedQuiz <= 0) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('three attempt finished'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Get.to(() => const ResultScreen(),
                                            transition:
                                                Transition.circularReveal,
                                            duration: const Duration(
                                                milliseconds: 500));
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Result')),
                                ],
                              );
                            },
                          );
                        } else {
                          quizController.wrongAnswer();
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: quizController.isColor.value
                              ? index ==
                                      questions[quizController
                                              .questionIndex.value]
                                          .correctOptionIndex
                                  ? quizController.selectIndex.value == index
                                      ? Colors.green.shade500
                                      : Colors.green.shade300
                                  : quizController.selectIndex.value == index
                                      ? Colors.red.shade700
                                      : Colors.transparent
                              : Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          questions[quizController.questionIndex.value]
                              .options[index],
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: quizController.isColor.value
                                  ? Colors.white
                                  : secounderyColor,
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: quizController.isColor.value
            ? FloatingActionButton(
                onPressed: () {
                  quizController.nextQuestion();
                  if (quizController.questionIndex.value ==
                      questions.length - 1) {
                    Get.to(() => const ResultScreen(),
                        transition: Transition.circularReveal,
                        duration: const Duration(milliseconds: 500));
                  }
                },
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: primaryColor,
                ),
              )
            : null,
      ),
    );
  }
}
