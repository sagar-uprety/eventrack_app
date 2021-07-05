import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../utilities/colors.dart';
import 'button.dart';

///Includes `Success`, `Warning` and `Error`
enum AlertType { Success, Warning, Error }

class ETDialog extends StatelessWidget {
  ///Alert Dialog
  const ETDialog(
    this.contentText, {
    Key? key,
    required this.onProceed,
    this.type = AlertType.Warning,
  }) : super(key: key);

  ///Information Text to display in the Dialog
  final String contentText;

  ///Type of alert
  ///Defaults to `type: AlertType.Warning`
  final AlertType type;

  ///Action to perform on proceed.
  final void Function() onProceed;

  IconData setIcon() {
    late IconData icon;
    switch (type) {
      case AlertType.Success:
        icon = Icons.check_circle_outline;
        break;
      case AlertType.Error:
        icon = Icons.remove_circle_outline;
        break;
      default:
        icon = Icons.warning_amber_rounded;
    }
    return icon;
  }

  Color setIconColor() {
    late Color color;
    switch (type) {
      case AlertType.Success:
        color = AppColors.green;
        break;
      case AlertType.Error:
        color = AppColors.red;
        break;
      default:
        color = AppColors.yellow;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(20.0),
      title: Icon(
        setIcon(),
        size: 38,
        color: setIconColor(),
      ),
      content: Text(
        "$contentText",
        style: Get.textTheme.bodyText1,
      ),
      actions: <Widget>[
        ETElevatedButton(
          childText: 'Proceed',
          onPressed: onProceed,
          fontSize: 14,
          size: Size(100, 50),
        ),
        ETTextButton(
          'Cancel',
          underline: false,
          onPressed: () => Get.back(),
        )
      ],
    );
  }
}
