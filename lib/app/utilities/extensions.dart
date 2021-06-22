import 'package:flutter/material.dart';

extension ChangeToButton on Widget {
  Widget changeToButton({required Function() onPressed}) => Stack(
        children: <Widget>[
          this,
          Positioned(
            left: 24,
            right: 24,
            top: 8,
            bottom: 8,
            child: TextButton(
              onPressed: onPressed,
              child: Center(),
            ),
          )
        ],
      );
}
