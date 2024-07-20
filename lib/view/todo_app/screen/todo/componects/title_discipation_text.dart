import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../../utils/color.dart';
import '../../../controller/details_controller.dart';
import '../../details/details_screen.dart';

Padding titleDiscipationText(DetailsController detailsController, int index) {
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
}
