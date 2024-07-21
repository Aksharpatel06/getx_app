import 'package:flutter/material.dart';

import '../../../../utils/color.dart';

Column createAccountWithLogin() {
  return Column(
    children: [
      const SizedBox(
        height: 40,
      ),
      Text(
        'Create new account',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w600,
          color: primaryColor,
        ),
      ),
      const SizedBox(
        height: 70,
      ),
      Text(
        'Or continue with',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w600,
          color: secounderyColor,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: countinerColor.withOpacity(0.5),
              image: const DecorationImage(
                image: AssetImage('asset/img/login/google.png'),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: countinerColor.withOpacity(0.5),
              image: const DecorationImage(
                image: AssetImage('asset/img/login/facebook.png'),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: countinerColor.withOpacity(0.5),
              image: const DecorationImage(
                image: AssetImage('asset/img/login/apple.png'),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
