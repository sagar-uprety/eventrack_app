import 'package:eventrack_app/app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedRectangularButton extends StatelessWidget {
  const RoundedRectangularButton({
    Key? key,
    required this.childText,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  final String childText;
  final Color? color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color ?? AppColors.blue),
        elevation: MaterialStateProperty.all(3),
        minimumSize: MaterialStateProperty.all(
          Size(Get.width * 0.40, 50),
        ),
      ),
      child: Text(
        childText,
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}
