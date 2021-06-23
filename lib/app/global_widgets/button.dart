import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../utilities/colors.dart';

class RoundedRectangularButton extends StatelessWidget {
  const RoundedRectangularButton({
    Key? key,
    required this.childText,
    required this.onPressed,
    this.size,
    this.color,
  }) : super(key: key);

  final String childText;
  final Color? color;
  final Size? size;
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
        fixedSize: MaterialStateProperty.all(
          size ?? null,
        ),
      ),
      child: Text(
        childText,
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}
