import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/view/todo_app/controller/details_controller.dart';

import '../../../../utils/color.dart';
import 'componects/save_update_button.dart';
import 'componects/text_field.dart';

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
            textField(detailsController),
            saveAndUpdateButton(detailsController),
          ],
        ),
      ),
    );
  }
}
