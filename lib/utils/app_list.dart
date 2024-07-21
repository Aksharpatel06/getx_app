import 'package:getx_app/view/api_app/screen/recipe/recipe_screen.dart';
import 'package:getx_app/view/login_app/screen/login_screen.dart';
import 'package:getx_app/view/quiz_app/screen/quiz/quiz_screen.dart';
import 'package:getx_app/view/todo_app/screen/todo/todo_screen.dart';

import '../view/main/modal/app_modal.dart';

List appList = [
  AppModel(title: 'Todo App', widget: const TodoScreen()),
  AppModel(title: 'Api App', widget: const RecipeScreen()),
  AppModel(title: 'Login App', widget: const LoginScreen()),
  AppModel(title: 'Quiz App', widget: const QuizScreen()),
];