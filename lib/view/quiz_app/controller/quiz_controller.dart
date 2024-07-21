import 'package:get/get.dart';

import '../../../utils/quiz_list.dart';

class QuizController extends GetxController {
  RxInt trueQuestion = 0.obs;
  RxInt limitedQuiz = 3.obs;
  RxInt questionIndex = 0.obs;
  RxBool isColor = false.obs;
  RxInt selectIndex = 0.obs;

  void wrongAnswer() {
    if (limitedQuiz >= 0) {
      limitedQuiz--;
    }
  }

  void rightAnswer() {
    if (questionIndex.value < questions.length) {
      trueQuestion++;
    }
  }

  void nextQuestion() {
    if (questionIndex.value < questions.length - 1 && limitedQuiz >= 0) {
      isColor.value = false;
      questionIndex++;
    }
  }

  void restartGame() {
    isColor.value = false;
    trueQuestion.value = 0;
    limitedQuiz.value = 3;
    questionIndex.value = 0;
    isColor.value = false;
    selectIndex.value = 0;
  }
}
