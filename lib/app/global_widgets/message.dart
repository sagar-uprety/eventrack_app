import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../utilities/colors.dart';

class FlashMessage {
  FlashMessage._();

  static successFlash(String message) {
    return Get.snackbar(
      '',
      '',
      titleText: Text(
        'Success',
        textAlign: TextAlign.center,
        style: Get.textTheme.bodyText1!.copyWith(
          color: AppColors.dark10,
        ),
      ),
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: Get.textTheme.bodyText1!.copyWith(
          color: AppColors.dark10,
        ),
      ),
      isDismissible: false,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.greenAccent,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      margin: EdgeInsets.all(0),
    );
  }

  static errorFlash(String message) {
    return Get.snackbar(
      '',
      '',
      titleText: Text(
        'Error',
        textAlign: TextAlign.center,
        style: Get.textTheme.bodyText1!.copyWith(
          color: AppColors.dark10,
        ),
      ),
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: Get.textTheme.bodyText1!.copyWith(
          color: AppColors.dark10,
        ),
      ),
      isDismissible: false,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      margin: EdgeInsets.all(0),
    );
  }
}
