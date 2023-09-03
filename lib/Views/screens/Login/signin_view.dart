import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Helpers/colors.dart';
import '../../../Helpers/images.dart';
import '../../../Helpers/navigate.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../Base/base_screen.dart';
import 'signup_view.dart';

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isVisible = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cLight,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(top: 40.0.sp),
              child: Column(
                children: <Widget>[
                  const Text('Hello Again!',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w700)),
                  SizedBox(height: 10.h),
                  Text(
                    'Fill your details or continue with social media',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.h),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        mailField(),
                        SizedBox(height: 15.h),
                        passwordField(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.all(12.0.sp),
                    child: Column(
                      children: [
                        CustomButton(
                          name: 'Sign In'.toUpperCase(),
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              getOff(const BaseView(), context);
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                          },
                          nameColor: cLight,
                          color: cBlue.withOpacity(.95),
                        ),
                        SizedBox(height: 22.h),
                        CustomButton(
                          name: 'Sign In with Google '.toUpperCase(),
                          onTap: () {},
                          nameColor: cDark,
                          icon: Image.asset(Assets.iconsGoogleIcon),
                          color: cLightGrey.withOpacity(.3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          newUserText(),
        ],
      ),
    );
  }

  CustomTextField mailField() {
    return CustomTextField(
      controller: emailController,
      labelText: 'Email Address',
      autovalidateMode: autovalidateMode,
      isPassword: false,
      suffixIc: const SizedBox(),
    );
  }

  CustomTextField passwordField() {
    return CustomTextField(
      controller: passController,
      isPassword: isVisible,
      labelText: 'Password',
      autovalidateMode: autovalidateMode,
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

  Align newUserText() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('New User?'),
              TextButton(
                onPressed: () {
                  getOff(const SignupView(), context);
                },
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.all(5.0), // This removes all padding
                ),
                child: Text(
                  "Create Account".toUpperCase(),
                  style: const TextStyle(
                      color: cBackGround, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}
