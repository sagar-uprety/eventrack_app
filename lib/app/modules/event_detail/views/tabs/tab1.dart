import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../global_widgets/button.dart';
import '../../../../pickers/datetimepicker.dart';
import '../../../../utilities/colors.dart';
import '../../controllers/event_detail_controller.dart';

class EventDetailTab1 extends GetView<EventDetailController> {
  const EventDetailTab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(
            '${controller.event.title}', //? Event Title
            style: Get.textTheme.headline5!
                .copyWith(fontWeight: FontWeight.w700, color: AppColors.dark80),
          ),
          subtitle: ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                controller
                    .event.author!.profile, //? Event author profile picture
              ),
            ),
            title: Text(
              controller.event.author!.name, //? Event author name
              style: Get.textTheme.subtitle1!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ).paddingOnly(top: 4),
          trailing: IconButton(
            icon: Icon(Icons.bookmark_border),
            iconSize: 34,
            onPressed: () => print('Bookmark'),
          ),
        ).paddingSymmetric(vertical: 8),
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
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 3,
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.calendar_today_outlined),
                horizontalTitleGap: 0,
                title: Text(
                  controller.event.dates!.length == 1
                      ? '${controller.event.dates!.formatDate[0]}'
                      : '${controller.event.dates!.formatDate[0]}\n${controller.event.dates!.formatDate[1]}',
                  style: Get.textTheme.overline,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                horizontalTitleGap: 0,
                leading: Icon(Icons.timer),
                title: Text(
                  '${controller.event.times![0]}\n${controller.event.times![1]}',
                  style: Get.textTheme.overline,
                ),
              ),
            ),
          ],
        ),
        Text(
          'Description',
          style: Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.w600),
        ).paddingOnly(top: 12),
        Obx(
          () => Text(
            '${controller.event.description}', //? Organization's description
            maxLines: !controller.showMore.value ? 12 : null,
            style: Get.textTheme.bodyText1,
          ),
        ),
        Obx(
          () => ETTextButton(
            !controller.showMore.value ? 'Show More' : 'Show Less',
            onPressed: controller.toggleDescriptionDisplay,
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 20);
  }
}
