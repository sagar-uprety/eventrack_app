import 'package:flutter/material.dart';

import '../../../../utilities/colors.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final onPress;
  final double radius;
  const RoundButton({
    required this.text,
    this.onPress,
    this.radius = 30,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 9),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          color: AppColors.purple,
          onPressed: onPress,
          child: Text(text,
              style: TextStyle(
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
