import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../models/event.dart';
import '../controllers/event_detail_controller.dart';

class EventDetailView extends GetView<EventDetailController> {
  Event event = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Event Detail View'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${event.eventTitle}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              maxLines: 2,
            ),
            Divider(),
            Text(
              '${event.eventDescription}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              maxLines: 100,
            ),
            Divider(),
          ],
        ));
  }
}
