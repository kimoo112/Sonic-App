
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/Views/screens/Base/base_screen.dart';
import 'package:shoes_store/Views/screens/Login/signin_view.dart';

class AuthStateChanges extends StatelessWidget {
  const AuthStateChanges({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const BaseView();
        } else {
          return const SigninView();
        }
      },
    );
  }
}
