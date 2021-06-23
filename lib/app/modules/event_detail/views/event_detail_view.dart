import 'package:flutter/material.dart';

import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:get/get.dart';

import '../../../models/event.dart';
import '../controllers/event_detail_controller.dart';
import 'components/detailbody.dart';

class EventDetailView extends GetView<EventDetailController> {
  final Event event = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: DetailBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(
            MfgLabs.heart,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
