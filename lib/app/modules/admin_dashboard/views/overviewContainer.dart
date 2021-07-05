import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utilities/colors.dart';
import '../models/overviewItemModel.dart';
import 'overviewTile.dart';

class OverviewContainer extends StatelessWidget {
  OverviewContainer({
    required this.title,
    required this.items,
  });

  final List<OverviewItemModel> items;
  final String title;

  final RxInt i = 0.obs;

  List<OverviewTile> _items(int index) {
    List<OverviewTile> returningItems = [];
    if (index == 0 && items.length % 2 != 0) {
      returningItems = [
        OverviewTile(
          items[index],
          width: Get.width - 72,
          onClicked: () => print(
              "Navigate to EVENT_LIST with filter as ${items[index].title} $title"),
        ),
      ];
      i.value++;
    } else {
      returningItems = [
        OverviewTile(
          items[index],
          onClicked: () => print(
            "Navigate to EVENT_LIST with filter as ${items[index].title} $title",
          ),
        ),
        OverviewTile(
          items[index + 1],
          onClicked: () => print(
            "Navigate to EVENT_LIST with filter as ${items[index + 1].title} $title",
          ),
        ),
      ];
      i.value += 2;
    }
    return returningItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.dark25.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.dark25.withOpacity(0.3),
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0.4,
          ),
        ],
      ),
      child: Obx(
        () => Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style:
                    Get.textTheme.headline5!.copyWith(color: AppColors.dark65),
              ),
            ),
            for (; i.value < items.length;)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _items(i.value),
              ).paddingOnly(top: 12)
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 12),
      ),
    ).paddingSymmetric(horizontal: 20, vertical: 8);
  }
}
