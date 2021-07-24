import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/formField.dart';
import '../../../global_widgets/tiles/eventCard.dart';
import '../controllers/event_list_controller.dart';

class EventListView extends GetView<EventListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ETAppBar(
          title: 'Explore Events',
          addBackButton: true,
        ),
        body: Obx(() {
          if (controller.isLoading.isTrue) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.events == null) {
            return Center(child: Text("Cound Not Fetch Data"));
          } else {
            return Column(children: [
              Stack(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.events!.length,
                    itemBuilder: (_, index) {
                      return EventCard(controller.events![index]);
                    },
                  ).paddingOnly(top: 70, bottom: 15),
                  Form(
                    key: controller.searchFormKey,
                    child: FormInputField(
                      label: 'Search',
                      controller: controller.searchText,
                      suffixIcon: Icons.search,
                      onClickedSuffix: controller.search,
                    ),
                  ),
                ],
              )
            ]);
          }
        }));
  }
}
