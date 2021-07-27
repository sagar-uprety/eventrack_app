import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../utilities/colors.dart';

class ETElevatedButton extends StatelessWidget {
  ///A Rectangular `ElevatedButton` with default radius
  const ETElevatedButton({
    Key? key,
    required this.childText,
    required this.onPressed,
    this.fontSize = 18,
    this.isGrey = false,
    this.size,
    this.color,
  }) : super(key: key);

  ///Text to display on the button
  final String childText;

  ///Defines the `fontSize` property of the text on the button - defaults to `fontSize: 18.0`.
  final double fontSize;

  ///`Color` of the button - defaults to `color: AppColors.blue`
  final Color? color;

  final bool isGrey;

  ///`fixedSize` of the button - defaults to `width: 40%` and `height: 50`
  final Size? size;

  ///Sets `ElevatedButton.onPressed` property
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            !isGrey ? (color ?? AppColors.blue) : AppColors.transparent),
        elevation: MaterialStateProperty.all(3),
        fixedSize: MaterialStateProperty.all(
          size ?? Size(Get.width * 0.40, 50),
        ),
      ),
      child: Text(
        childText,
        style: Theme.of(context).textTheme.button!.copyWith(fontSize: fontSize),
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

  ///Text to display on the button
  final String text;

  ///Underlines the button text on `underline: true` - defaults to true
  final bool underline;

  ///Sets `TextButton.onPressed` property
  final Function() onPressed;

  ///Defines the `fontSize` property of the text on the button - defaults to `fontSize: 14.0`.
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
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          Size(double.minPositive, 20),
        ),
      ),
    );
  }
}
