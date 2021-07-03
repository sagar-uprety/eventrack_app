import 'package:eventrack_app/app/global_widgets/appBar.dart';
import 'package:eventrack_app/app/global_widgets/button.dart';
import 'package:eventrack_app/app/global_widgets/tiles/eventCard.dart';
import 'package:eventrack_app/app/global_widgets/tiles/horizontalEventCard.dart';
import 'package:eventrack_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/userdashboard_controller.dart';

class UserdashboardView extends GetView<UserdashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ETAppBar(
        addBackButton: true,
        title: 'Home',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildEventList('New Events', vertical: false),
            _buildEventList('My Events'),
            _buildEventList('My Favourites'),
          ],
        ),
      ),
    );
  }

  Widget _buildEventList(String title, {bool vertical = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Get.textTheme.headline6,
            ),
            ETTextButton(
              'See All',
              onPressed: () => Get.toNamed(Routes.EVENT_LIST),
            )
          ],
        ).paddingSymmetric(horizontal: 20),
        vertical ? _verticalList() : _horizontalList(),
      ],
    );
  }

  Widget _horizontalList() {
    return SizedBox(
      height: 174,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 12),
        itemCount:
            !(controller.events.length >= 8) ? controller.events.length : 8,
        itemBuilder: (_, i) => HorizontalEventCard(controller.events[i]),
      ),
    );
  }

  Widget _verticalList() {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        itemCount:
            !(controller.events.length >= 3) ? controller.events.length : 3,
        itemBuilder: (_, i) => EventCard(controller.events[i]),
      ),
    );
  }
}
