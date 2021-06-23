import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

class ETTextButton extends StatelessWidget {
  const ETTextButton(this.text,
      {Key? key,
      required this.onPressed,
      this.underline = true,
      this.fontSize = 14.0})
      : super(key: key);

  final String text;
  final bool underline;
  final Function() onPressed;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        '$text',
        style: Get.textTheme.button!.copyWith(
          color: AppColors.blue,
          fontSize: fontSize,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none,
          textBaseline: TextBaseline.alphabetic,
        ),
      ),
    );
  }
}
