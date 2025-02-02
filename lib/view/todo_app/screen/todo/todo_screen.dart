import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/utils/color.dart';
import 'package:getx_app/view/todo_app/screen/details/details_screen.dart';

import '../../controller/details_controller.dart';
import 'componects/title_discipation_text.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsController detailsController = Get.put(DetailsController());
    return Scaffold(
      backgroundColor: boxColor,
      appBar: AppBar(
        backgroundColor: secounderyColor,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          'TODO',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Obx(
          () => ListView.builder(
            shrinkWrap: true,
            itemCount: detailsController.todoList.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return titleDiscipationText(detailsController, index);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          detailsController.isUpdate.value = false;

          Get.to(() => const DetailsScreen(),
              duration: const Duration(milliseconds: 500),
              transition: Transition.circularReveal);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
