import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/Controller/create_user_email_password_controller.dart';
import 'package:shoes_store/Views/screens/Base/base_screen.dart';

import '../../../Controller/google_auth_controller.dart';
import '../../../Helpers/colors.dart';
import '../../../Helpers/images.dart';
import '../../../Helpers/navigate.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import 'signin_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GoogleAuthController controller = Get.find();
  CreateUserEmailPasswordController createUsercontroller = Get.find();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: double.infinity,
            child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Stack(
                  children: [
                    Column(children: [
                      const Text('Register Account',
                          style: TextStyle(
                              color: cBlue,
                              fontSize: 32,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 10),
                      const Text(
                        'Fill your details or continue with social media',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            nameFieldUp(),
                            emailFieldUp(),
                            passFieldUp(),
                            Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    signUpButton(context),
                                    const SizedBox(height: 22),
                                    googleSignUpButton(),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ]),
                    alreadyHaveAccount(context)
                  ],
                ))));
  }

  CustomButton googleSignUpButton() {
    return CustomButton(
      name: 'Sign In with Google '.toUpperCase(),
      onTap: () {
        controller.signInWithGoogle(context);
      },
      nameColor: cDark,
      icon: Image.asset(Assets.iconsGoogleIcon),
      color: cLightGrey.withOpacity(.3),
    );
  }

  CustomButton signUpButton(BuildContext context) {
    return CustomButton(
      name: 'Sign Up'.toUpperCase(),
      onTap: ()  {
        if (formKey.currentState!.validate()) {
          bool isSignUpSuccessful =  createUsercontroller.signUp(
            emailController.text,
            passController.text,
            nameController.text,
            context,
          );

          if (isSignUpSuccessful) {
            getOff(const BaseView(), context);
          } else {
            // Handle the error in UI, maybe show a snackbar?
          }
        } else {
          autovalidateMode = AutovalidateMode.always;
          setState(() {});
        }
      },
      nameColor: cLight,
      color: cBlue.withOpacity(.95),
    );
  }

  Align alreadyHaveAccount(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already Have Account?'),
              TextButton(
                onPressed: () {
                  getOff(const SigninView(), context);
                },
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.all(5.0), // This removes all padding
                ),
                child: Text(
                  " LogIn".toUpperCase(),
                  style: const TextStyle(
                      color: cBackGround, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }

  CustomTextField nameFieldUp() {
    return CustomTextField(
        controller: nameController,
        labelText: 'Your Name',
        autovalidateMode: autovalidateMode,
        isPassword: false,
        suffixIc: const SizedBox());
  }

  CustomTextField emailFieldUp() {
    return CustomTextField(
        controller: emailController,
        labelText: 'Email',
        autovalidateMode: autovalidateMode,
        isPassword: false,
        suffixIc: const SizedBox());
  }

  CustomTextField passFieldUp() {
    return CustomTextField(
      controller: passController,
      labelText: 'Password',
      autovalidateMode: autovalidateMode,
      isPassword: isVisible,
      suffixIc: IconButton(
        onPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        icon: isVisible
            ? const Icon(Icons.remove_red_eye_outlined)
            : const Icon(Icons.remove_red_eye_sharp),
      ),
    );
  }
}
