import 'package:eventrack_app/app/global_widgets/tiles/participantCard.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../global_widgets/tiles/eventCard.dart';
import '../../controllers/organization_profile_controller.dart';

class OrganizationProfileTab2 extends GetView<OrganizationProfileController> {
  const OrganizationProfileTab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          controller.createdEventList.length != 0
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.createdEventList.length,
                  itemBuilder: (_, index) {
                    return EventCard(controller.createdEventList[index]);
                  },
                ).paddingOnly(top: 12, bottom: 15)
              : Center(
                  child: Text('Data not found'),
                ),
        ],
      ),
    );
  }
}
