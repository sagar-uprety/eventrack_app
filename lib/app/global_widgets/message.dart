import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../utilities/colors.dart';

class FlashMessage {
  ///Displays a `Snackbar`
  ///
  ///On `state: false`, the background of the `Snackbar` is red.
  ///On `state: true`, the background of the `Snackbar` is green.
  ///
  ///If you do not want to display the `Snackbar`, do not pass `message`.
  FlashMessage(bool state, {String? message}) {
    if (state)
      _successFlash(message!);
    else
      _errorFlash(message!);
  }

  static _successFlash(String? message) {
    if (message != null || message != '')
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
          message!,
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

  static _errorFlash(String? message) {
    if (message != null || message != '')
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
          message!,
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
