import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../models/event/event.dart';
import '../../pickers/datetimepicker.dart';
import '../../routes/app_pages.dart';
import '../../utilities/colors.dart';
import '../card.dart';

class EventCard extends StatelessWidget {
  const EventCard(this.event);
  final Event event;
  @override
  Widget build(BuildContext context) {
    return ETCard(
      route: Routes.EVENT_DETAIL,
      argument: event,
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: NetworkImage(event.eventProfile!),
              // ),
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
            child: !(event.eventProfile != null)
                ? FittedBox(
                    child: Center(
                      child: Text(
                        'No Cover'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headline1!
                            .copyWith(color: AppColors.dark80),
                      ).paddingAll(20),
                    ),
                  )
                : Center(),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title!,
                  overflow: TextOverflow.ellipsis,
                  style: Get.textTheme.headline6,
                ),
                Text(
                  "${event.categories!.join(", ")}",
                  overflow: TextOverflow.ellipsis,
                  style: Get.textTheme.subtitle2,
                ),
                Text(
                  "${event.dateTime!.dates.formatDate[0]}",
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${event.location!.location}",
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ).paddingSymmetric(horizontal: 10, vertical: 4),
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 24, vertical: 8);
  }
}
