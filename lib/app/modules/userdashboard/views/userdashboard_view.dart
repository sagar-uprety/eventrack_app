import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/app_drawer.dart';
import '../../../global_widgets/button.dart';
import '../../../global_widgets/tiles/eventCard.dart';
import '../../../global_widgets/tiles/horizontalEventCard.dart';
import '../../../models/event/event.dart';
import '../controllers/userdashboard_controller.dart';

class UserdashboardView extends GetView<UserdashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ETAppBar(
        title: 'Home',
      ),
      drawer: buildAppDrawer(),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: <Widget>[
              _buildEventList(
                'New Events',
                controller.events,
                vertical: false,
              ),
              _buildEventList(
                'My Favourites',
                controller.favourites,
              ),
              _buildEventList(
                'My Events',
                controller.myEvents,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventList(String title, List<Event> list,
      {bool vertical = true}) {
    if (list.length != 0)
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
                onPressed: () => controller.seeAll(title),
              )
            ],
          ).paddingSymmetric(horizontal: 20),
          vertical ? _verticalList(list) : _horizontalList(list),
        ],
      );
    else
      return Container();
  }

  Widget _horizontalList(List<Event> list) {
    return Obx(() => SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemCount: !(list.length >= 8) ? list.length : 8,
            itemBuilder: (_, i) => HorizontalEventCard(list[i]),
          ),
        ));
  }

  Widget _verticalList(List<Event> list) {
    double height = 360;
    if (list.length == 1)
      height = 120;
    else if (list.length == 2) height = 240;
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        itemCount: !(list.length >= 3) ? list.length : 3,
        itemBuilder: (_, i) {
          return EventCard(list[i]);
        },
      ),
    );
  }
}
