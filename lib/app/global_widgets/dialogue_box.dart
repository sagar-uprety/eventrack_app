import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../utilities/colors.dart';
import 'button.dart';

///Includes `Success`, `Warning` and `Error`
enum AlertType { Success, Warning, Error }

///Alert Dialog
class ETDialog extends StatelessWidget {
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
        RoundedRectangularButton(
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

AlertDialog deleteDialog(BuildContext context) {
  return AlertDialog(
    contentTextStyle: Theme.of(context).textTheme.bodyText1,
    actionsPadding: EdgeInsets.only(right: 10),
    contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 10.0),
    title: Center(
      child: Column(
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: Colors.red,
            size: 30,
          ),
          SizedBox(
            height: 10,
          ),
          Text("Delete User?"),
        ],
      ),
    ),
    content: Text(
      "Please confirm to delete user",
      style: TextStyle(fontSize: 14),
    ),
    actions: <Widget>[
      MaterialButton(
        color: Color(0xFFDDDDDD),
        child: Text(
          "Cancel",
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 16,
                color: Colors.black,
              ),
        ),
        onPressed: () {
          Get.back();
        },
      ),
      MaterialButton(
        color: Color(0xFFd99595),
        child: Text(
          "Delete",
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 16,
                color: Colors.white,
              ),
        ),
        onPressed: () {
          Get.back();
          print("item deleted");
        },
      ),
    ],
  );
}
