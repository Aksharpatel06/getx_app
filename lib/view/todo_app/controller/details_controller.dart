
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/view/todo_app/model/todo_model.dart';

class DetailsController extends GetxController{


  RxList<TodoModel> todoList=<TodoModel>[].obs;

  RxInt editIndex = 0.obs;
  RxBool isUpdate = false.obs;

  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtDiscription = TextEditingController();


  void createData(TodoModel todoModal)
  {
    txtTitle.clear();
    txtDiscription.clear();
    todoList.add(todoModal);
  }

  void removeData(int index)
  {
    todoList.removeAt(index);
  }

  void editData(int index,)
  {
    txtTitle = TextEditingController(text: todoList[index].title);
    txtDiscription = TextEditingController(text: todoList[index].discription);
    editIndex.value = index;
  }

  void updateData()
  {
    todoList[editIndex.value].title = txtTitle.text;
    todoList[editIndex.value].discription = txtDiscription.text;
    todoList.refresh();
  }

}