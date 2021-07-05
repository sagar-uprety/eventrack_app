import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utilities/colors.dart';
import '../models/overviewItemModel.dart';

class OverviewTile extends StatelessWidget {
  ///A colored tile to display an information in the `OverviewContainer`.
  const OverviewTile(this.item, {this.width, required this.onClicked});

  ///Infomation to display in the tile.
  final OverviewItemModel item;

  ///Width of the tile.
  ///
  ///Defaults to 39% of Viewport.
  final double? width;

  ///Add a Navigator to pass on to `EVENT_LIST` with filter.
  final void Function()? onClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        width: width ?? Get.width * 0.39,
        decoration: BoxDecoration(
          color: item.color.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: Get.textTheme.headline5!
                      .copyWith(color: AppColors.dark65),
                ),
                Text(
                  '${item.count}',
                  style: Get.textTheme.headline4!.copyWith(
                      color: AppColors.dark80, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
