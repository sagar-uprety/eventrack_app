import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../models/event/event.dart';
import '../../pickers/datetimepicker.dart';
import '../../routes/app_pages.dart';
import '../../utilities/colors.dart';
import '../card.dart';

class HorizontalEventCard extends StatelessWidget {
  const HorizontalEventCard(this.event);
  final Event event;
  @override
  Widget build(BuildContext context) {
    return ETCard(
      route: Routes.EVENT_DETAIL,
      argument: event,
      width: 200,
      height: 150,
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              image: event.eventProfile != null
                  ? DecorationImage(
                      image: NetworkImage(event.eventProfile!),
                      fit: BoxFit.cover,
                    )
                  : null,
              gradient: RadialGradient(
                center: Alignment.topRight,
                radius: 2.0,
                colors: <Color>[
                  AppColors.dark65,
                  AppColors.dark10,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Chip(
                  label: Text(
                    event.dateTime!.dates.formatDate[0],
                    style: Get.textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.dark50,
                    ),
                  ),
                  labelPadding:
                      EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                  elevation: 1,
                ),
                !(event.eventProfile != null)
                    ? Expanded(
                        child: Center(
                          child: Text(
                            '${event.title}'.toUpperCase(),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: Get.textTheme.headline6!
                                .copyWith(color: AppColors.dark80),
                          ),
                        ),
                      )
                    : Center(),
              ],
            ).paddingAll(4),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title!,
                  style: Get.textTheme.bodyText1!.copyWith(
                    color: AppColors.dark65,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  event.location!.location,
                  style: Get.textTheme.bodyText2,
                )
              ],
            ).paddingSymmetric(horizontal: 10),
          )
        ],
      ),
    ).paddingSymmetric(horizontal: 8, vertical: 12);
  }
}
