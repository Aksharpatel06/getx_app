import 'package:flutter/material.dart';

import '../../../controller/details_controller.dart';

Column textField(DetailsController detailsController) {
  return Column(
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
  );
}
