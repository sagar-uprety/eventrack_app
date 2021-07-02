import 'package:flutter/material.dart';

import 'package:dart_date/dart_date.dart';
import 'package:get/get.dart';

import '../../../models/event/event.dart';
import '../../../pickers/datetimepicker.dart';

class UserdashboardController extends GetxController {
  get event => _event;

  final Event _event = Event(
    title: 'EventTrack',
    // description:
    // 'n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design. \nLorem ipsum is typically a corrupted version of \'De finibus bonorum et malorum\', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.',
    categories: ['Educational', 'Sports'],
    dateTime: TimeDate(
        dates: [
          (Date.today + Duration(days: 30)).toIso8601String(),
        ],
        times: [
          TimeOfDay(hour: 9, minute: 0),
          TimeOfDay(hour: 18, minute: 0),
        ].formatTime),
    location: Location(
      latitude: 34.2334,
      longitude: 43.4542,
      location: 'New York, USA',
    ),
  );

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
