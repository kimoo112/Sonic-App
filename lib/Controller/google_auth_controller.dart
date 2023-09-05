import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/Helpers/colors.dart';

class GoogleAuthController extends GetxController {
  Future signInWithGoogle() async {
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

    return await FirebaseAuth.instance.signInWithCredential(credential);
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
    backgroundColor:cSoSad, // Red for alert
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
