import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_app/view/api_app/modal/main_modal.dart';

import 'helper/api_sarvice.dart';

class RecipeController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
  MainModal? mainModal;
  Future<void> getData()
  async {
    ApiSarvice apiSarvice = ApiSarvice();
    String? json = await apiSarvice.fetchData();
    Map jsonData = jsonDecode(json!);
    if (jsonData.isNotEmpty) {

      mainModal = MainModal.fromJson(jsonData);
      print(jsonData);
      update();
    }
  }
}