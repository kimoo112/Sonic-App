import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/Views/screens/Base/base_screen.dart';

import '../Helpers/colors.dart';
import '../Helpers/navigate.dart';
import '../Views/screens/Login/signin_view.dart';
import 'cart_controller.dart';

class GoogleAuthController extends GetxController {
  CartController controller = Get.find();

  Future signInWithGoogle(context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return showGoogleUserNullSnackBar();
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    return getOff(const BaseView(), context);
  }

  logOut(context) async {
    GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();
    controller.deleteAllCart();
    // ignore: use_build_context_synchronously
    getOff(const SigninView(), context);
  }
}

void showGoogleUserNullSnackBar() {
  Get.snackbar(
    "Login Alert", // title
    "Google sign-in failed. Please try again.", // message
    snackPosition: SnackPosition.BOTTOM,
    titleText: const Text(
      "Oh, Shoe-t!",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    messageText: const Text(
      "Seems like you haven't picked a Google account. Let's lace up and try again!",
      style: TextStyle(
        color: Colors.white70,
        fontSize: 15,
      ),
    ),
    backgroundColor: cSoSad, // Red for alert
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    duration: const Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,

    forwardAnimationCurve: Curves.easeOutCubic,
    reverseAnimationCurve: Curves.easeInOutCubic,
    icon: const Icon(Iconsax.security_safe, size: 35.0, color: Colors.white),
  );
}
