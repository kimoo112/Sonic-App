import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/switcher_controller.dart';
import '../../Helpers/colors.dart';

// ignore: must_be_immutable
class NotficationView extends StatelessWidget {
  NotficationView({Key? key}) : super(key: key);
  SwitcherController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
            child: Switch(
                activeColor: cWhite,
                activeTrackColor: cBlue,
                inactiveThumbColor: cLightGrey.withOpacity(.5),
                trackOutlineColor: const MaterialStatePropertyAll(cTransparent),
                inactiveTrackColor: cRed,
                value: controller.isAllowed.value,
                onChanged: (value) {
                  controller.switcher();
                })),
      ),
    );
  }
}
