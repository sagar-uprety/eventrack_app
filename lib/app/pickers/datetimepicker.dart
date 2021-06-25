import 'package:flutter/material.dart';

import 'package:dart_date/dart_date.dart';
import 'package:get/get.dart';

class DateTimePicker {
  static Future<List<String>> datePicker(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: Date.tomorrow,
      firstDate: Date.today,
      lastDate: Date.today + Duration(days: 365),
      initialEntryMode: DatePickerEntryMode.calendar,
    ).then((value) => value != null ? [value.toIso8601String()] : []);
  }

  static Future<List<String>> dateRangePicker(BuildContext context) async {
    return await showDateRangePicker(
      context: context,
      firstDate: Date.today,
      lastDate: Date.today + Duration(days: 365),
      initialEntryMode: DatePickerEntryMode.calendar,
    ).then((value) => value != null
        ? [value.start.toIso8601String(), value.end.toIso8601String()]
        : []);
  }

  static Future<List<TimeOfDay>> timePicker(BuildContext context) async {
    List<TimeOfDay> times = [];
    TimeOfDay? start = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 10, minute: 00),
      helpText: 'Select Start Time',
    );
    if (start != null) {
      TimeOfDay? end = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: start.hour + 2, minute: start.minute),
        helpText: 'Select End Time',
      );
      if (end != null) times = [start, end];
    }
    return times;
  }

  // static DateTime concatDateTime(DateTime date, TimeOfDay time) {
  //   return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  // }
}

extension DateFormat on List<String> {
  List<String> get formatDate {
    List<String> dates = [];
    this.forEach((element) =>
        dates.add(DateTime.parse(element).format('EEEE, MMM d, ' 'yyyy')));
    return dates;
  }

  int get difference =>
      this.parseDate[1].difference(this.parseDate[0]).inDays + 1;
}

extension TimeFormat on List<TimeOfDay> {
  List<String> get formatTime {
    List<String> times = [];
    this.forEach((element) => times.add(element.format(Get.context!)));
    return times;
  }
}

extension ParseDateTime on List<String> {
  List<TimeOfDay> get parseTime {
    List<TimeOfDay> times = [];
    this.forEach((element) {
      List<String> time = element.split(':');
      times
          .add(TimeOfDay(hour: int.parse(time[0]), minute: int.parse(time[1])));
    });
    return times;
  }

  List<DateTime> get parseDate {
    List<DateTime> dates = [];
    this.forEach((element) {
      dates.add(DateTime.parse(element));
    });
    return dates;
  }
}
