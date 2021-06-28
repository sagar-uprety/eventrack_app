import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/formField.dart';
import '../controllers/event_list_controller.dart';
import '../../../global_widgets/tiles/eventCard.dart';

class EventListView extends GetView<EventListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ETAppBar(
        title: 'Explore Events',
        addBackButton: true,
      ),
      body: Column(
        children: [
          Form(
            key: controller.searchFormKey,
            child: FormInputField(
              label: 'Search',
              controller: controller.searchText,
              suffixIcon: Icons.search,
              onClickedSuffix: controller.search,
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: controller.events.length,
              itemBuilder: (_, index) {
                return EventCard(controller.events[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
