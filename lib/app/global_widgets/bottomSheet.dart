import 'package:flutter/material.dart';

import 'package:get/utils.dart';

import '../utilities/colors.dart';

class ETBottomSheet extends StatelessWidget {
  const ETBottomSheet({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      elevation: 3,
      onClosing: () => print('Closing'),
      builder: (_) => child.paddingSymmetric(vertical: 10),
    );
  }
}
