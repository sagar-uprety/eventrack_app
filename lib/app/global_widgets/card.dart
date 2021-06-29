import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../utilities/colors.dart';

///Adds a padded `Card` with `radius: 12` in each corner.
class ETCard extends StatelessWidget {
  const ETCard(
      {Key? key,
      //TODO: Make this required.
      this.route,
      required this.argument,
      required this.child,
      this.height = 100})
      : super(key: key);

  ///Requires a route of a detail screen to navigate on tappping the card.
  ///
  ///Example: Routes.EVENT_DETAIL
  final String? route;

  ///Requires a model value as an argument to pass on to the next `route`.
  final Object argument;

  ///Requires a child to display inside the card.
  final Widget child;

  ///`height` of the card.
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Get.toNamed(
      //   route!,
      //   arguments: argument,
      // ),
      onTap: () => print(argument.toString()),
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.cardColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.dark25,
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0.4,
            ),
          ],
        ),
        child: child,
      ),
    ).paddingSymmetric(horizontal: 24, vertical: 8);
  }
}
