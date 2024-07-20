import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/color.dart';
import '../../../controller/details_controller.dart';
import '../../../model/todo_model.dart';

GestureDetector saveAndUpdateButton(DetailsController detailsController) {
  return GestureDetector(
    onTap: () {
      if (detailsController.isUpdate.value) {
        detailsController.updateData();
      } else {
        TodoModel todoModal = TodoModel(
          title: detailsController.txtTitle.text,
          discription: detailsController.txtDiscription.text,
        );
        detailsController.createData(todoModal);
      }
      Get.back();
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 60,
        alignment: Alignment.center,
        decoration:
        BoxDecoration(border: Border.all(color: primaryColor)),
        child: Text(
          'Save',
          style: TextStyle(
            color: primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}
