import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/utils/color.dart';
import 'package:getx_app/view/login_app/controller/login_controller.dart';

import 'componects/create_account_with_continue_login.dart';
import 'componects/login_title.dart';
import 'componects/sign_in_button.dart';
import 'componects/text_field_and_forgot.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txtMail = TextEditingController();
    TextEditingController txtPwd = TextEditingController();

    LoginController loginController = Get.put(LoginController());

    return Scaffold(
      backgroundColor: boxColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/img/login/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  loginTitle(),
                  textFieldAndForgot(txtMail, txtPwd),
                  signInButton(loginController, txtMail, txtPwd),
                  createAccountWithLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
