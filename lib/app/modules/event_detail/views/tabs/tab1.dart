import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../global_widgets/button.dart';
import '../../../../pickers/datetimepicker.dart';
import '../../../../temp_data.dart';
import '../../../../utilities/colors.dart';
import '../../controllers/event_detail_controller.dart';

class EventDetailTab1 extends GetView<EventDetailController> {
  const EventDetailTab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              '${controller.event.title}', //? Event Title
              style: Get.textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w700, color: AppColors.dark80),
            ),
            trailing: IconButton(
              icon: Icon(!controller.addedToFavourites.value
                  ? Icons.bookmark_border
                  : Icons.bookmark),
              iconSize: 34,
              onPressed: controller.addtoFavorites,
            ),
          ).paddingSymmetric(vertical: 8),
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 12,
          children: [
            for (String category in controller.event.categories!)
              Chip(
                label: Text(category),
                labelPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                elevation: 1,
              ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 50.0,
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.calendar_today_outlined),
                horizontalTitleGap: 0,
                title: Text(
                  controller.formattedDates.length == 1
                      ? '${controller.formattedDates[0]}'
                      : '${controller.formattedDates[0]}\n${controller.formattedDates[1]}',
                  style: Get.textTheme.overline,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                horizontalTitleGap: 0,
                leading: Icon(Icons.timer),
                title: Text(
                  '${controller.event.dateTime!.times[1]} - ${controller.event.dateTime!.times[1]}',
                  style: Get.textTheme.overline,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Description',
          style: Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.w600),
        ).paddingOnly(top: 12),
        Text(
          '${controller.event.description}', //? Organization's description
          // maxLines: !controller.showMore.value ? 12 : null,
          style: Get.textTheme.bodyText1,
        ),
        // Obx(
        //   () => Padding(
        //     padding: const EdgeInsets.only(bottom: 20.0),
        //     child: ETTextButton(
        //       !controller.showMore.value ? 'Show More' : 'Show Less',
        //       onPressed: controller.toggleDescriptionDisplay,
        //     ),
        //   ),
        // ),
        if (!controller.myEvent)
          Obx(
            () => Center(
              child: !controller.registering.value
                  ? ETElevatedButton(
                      childText: controller.registered.value
                          ? 'Registered'
                          : "Register",
                      onPressed: controller.registerforevent,
                    )
                  : CircularProgressIndicator(),
            ),
          ).paddingSymmetric(vertical: 20),
      ],
    ).paddingSymmetric(horizontal: 20);
  }
}
