import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/Helpers/navigate.dart';
import 'package:shoes_store/Views/screens/Base/base_screen.dart';

class CreateUserEmailPasswordController extends GetxController {
  signUp(emailAddress, password, name, context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await credential.user?.updateDisplayName(name);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showErrorSnackBar(
            'weak-password', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showErrorSnackBar('email-already-in-use',
            'The account already exists for that email.');
      }
      getOff(const BaseView(), context);
    }
  }
}

void showErrorSnackBar(title, subtitle) {
  Get.snackbar(title, subtitle,
      icon: const Icon(Icons.exit_to_app, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      forwardAnimationCurve: Curves.easeInOutCirc,
      reverseAnimationCurve: Curves.easeOutCirc,
      mainButton: TextButton(
        onPressed: () {
          Get.back(); // Close the snackbar
        },
        child: const Text(
          "CLOSE",
          style: TextStyle(color: Colors.white),
        ),
      ));
}
