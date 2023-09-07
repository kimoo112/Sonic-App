import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Helpers/Strings/get_storage.dart';
import '../Helpers/colors.dart';

class SwitcherController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    readSwitcher();
  }

  RxBool isAllowed = false.obs;

  switcher() {
    isAllowed.value = !isAllowed.value;
    saveSwitcher();

    if (isAllowed.value == true) {
      AwesomeNotifications().createNotification(
          schedule: 
          NotificationAndroidCrontab.minutely(
            
              referenceDateTime: DateTime.now()),
          content: NotificationContent(
              id: 10,
              
              channelKey: 'basic key',
              title: 'Discover What\'s New!',
              body: 'Step inside and explore the latest in footwear elegance.',
              actionType: ActionType.Default));
      switcherAllowed();
    } else {
      AwesomeNotifications().cancelAll();
    }
  }

  saveSwitcher() {
    storage.write('key', isAllowed.value);
  }

  readSwitcher() {
    if (storage.read('key') != null) {
      isAllowed.value = storage.read('key');
    } else {}
  }
}

switcherAllowed() {
  Get.snackbar(
    "Notifications Allowed", // title
    "You'll receive updates and news!", // message
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(Icons.notifications_active, color: cBlue),
    shouldIconPulse: false,
    margin: const EdgeInsets.all(12),
    barBlur: 20,
    isDismissible: true,
    duration: const Duration(seconds: 2),
    backgroundColor: cWhite,
    overlayBlur: 0.5,
    overlayColor: Colors.black45,
    boxShadows: [
      const BoxShadow(
          color: Colors.black38,
          spreadRadius: 0,
          blurRadius: 10,
          offset: Offset(0, 10)),
    ],
    titleText: const Text("Notifications Allowed",
        style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: cBlue)),
    messageText: const Text("You'll receive updates and news!",
        style: TextStyle(color: cLightGrey)),
  );
}

switcherDisallowed() {
  Get.snackbar(
    "Notifications Disallowed", // title
    "You won't receive any notifications.", // message
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(Icons.notifications_off, color: Colors.red),
    shouldIconPulse: false,
    barBlur: 20,
    isDismissible: true,
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.white,
    overlayBlur: 0.5,
    overlayColor: Colors.black45,
    boxShadows: [
      const BoxShadow(
          color: Colors.black38,
          spreadRadius: 0,
          blurRadius: 10,
          offset: Offset(0, 10)),
    ],
    titleText: const Text("Notifications Disallowed",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red)),
    messageText: const Text("You won't receive any notifications.",
        style: TextStyle(color: Colors.black)),
  );
  Get.snackbar(
    "Notifications Allowed", // title
    "You'll receive updates and news!", // message
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(Icons.notifications_active, color: Colors.green),
    shouldIconPulse: false,
    barBlur: 20,
    isDismissible: true,
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.white,
    overlayBlur: 0.5,
    overlayColor: Colors.black45,
    boxShadows: [
      const BoxShadow(
          color: Colors.black38,
          spreadRadius: 0,
          blurRadius: 10,
          offset: Offset(0, 10)),
    ],
    titleText: const Text("Notifications Allowed",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green)),
    messageText: const Text("You'll receive updates and news!",
        style: TextStyle(color: Colors.black)),
  );
}
