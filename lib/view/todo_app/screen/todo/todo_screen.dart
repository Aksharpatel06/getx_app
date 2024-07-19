import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:getx_app/utils/color.dart';
import 'package:getx_app/view/todo_app/screen/details/details_screen.dart';

import '../../controller/details_controller.dart';

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
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          detailsController.isUpdate.value = true;
                          detailsController.editData(index);
                          Get.to(const DetailsScreen(),
                              duration: const Duration(milliseconds: 500),
                              transition: Transition.circularReveal);
                        },
                        backgroundColor: Colors.grey.shade800,
                        icon: Icons.edit,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          detailsController.removeData(index);
                        },
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: countinerColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: ListTile(
                        // text
                        title: Text(
                          detailsController.todoList[index].title,
                        ),
                        subtitle:
                            Text(detailsController.todoList[index].discription),
                      ),
                    ),
                  ),
                ),
              );
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
