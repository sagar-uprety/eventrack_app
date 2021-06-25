import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/card.dart';
import '../../../pickers/datetimepicker.dart';
import '../../../routes/app_pages.dart';
import '../models/Event_listmodel.dart';

class EventCard extends StatelessWidget {
  const EventCard(this.event);
  final EventsModel event;
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
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(event.eventCover!),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title!,
                style: Get.textTheme.headline6,
              ),
              Text(
                "${event.categories!.join(", ")}",
                style: Get.textTheme.subtitle2,
              ),
              Text("${event.dates!.formatDate[0]}"),
              Text("${event.location!.location}"),
            ],
          ).paddingSymmetric(horizontal: 10, vertical: 4),
        ],
      ),
    );
  }
}
