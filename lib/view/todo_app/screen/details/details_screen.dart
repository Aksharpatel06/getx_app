import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/view/todo_app/controller/details_controller.dart';
import 'package:getx_app/view/todo_app/model/todo_model.dart';

import '../../../../utils/color.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsController detailsController = Get.find();
    return Scaffold(
      backgroundColor: boxColor,
      appBar: AppBar(
        backgroundColor: secounderyColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'TODO Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: detailsController.txtTitle,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(), hintText: 'Title'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 4,
                    minLines: 1,
                    textInputAction: TextInputAction.done,
                    controller: detailsController.txtDiscription,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Discription'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            GestureDetector(
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
            ),
          ],
        ),
      ),
    );
  }
}
