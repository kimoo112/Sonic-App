// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

void getOff(Widget, context) => Get.offAll(Widget,
    transition: Transition.fadeIn, duration: const Duration(milliseconds: 1500));

void getTo(Widget, context) => Get.to(Widget,
    transition: Transition.fade, duration: const Duration(milliseconds: 1500));

void getToSearch(Widget, context) => Get.to(Widget,
    transition: Transition.cupertino, duration: const Duration(milliseconds: 800));

void navigateToPSearch(Widget, context) => Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, _) {
          return FadeTransition(
            opacity: animation,
            child: Widget,
          );
        },
      ),
    );
