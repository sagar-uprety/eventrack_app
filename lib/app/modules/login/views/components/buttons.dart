import 'package:eventrack_app/app/utilities/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.text, required this.press})
      : super(key: key);
  final String text;

  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColors.purple,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 110.0),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 16, height: 1.5),
          ),
        ),
      ),
    );
  }
}
