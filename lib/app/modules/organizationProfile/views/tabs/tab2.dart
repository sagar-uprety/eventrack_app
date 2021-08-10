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
          Text(
            "Organized Events",
            style:
                Get.textTheme.headline4!.copyWith(fontWeight: FontWeight.w700),
          ).paddingOnly(left: 24, top: 10),
          controller.createdEventList.length != 0
              ? Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.createdEventList.length,
                    itemBuilder: (_, index) {
                      return EventCard(controller.createdEventList[index]);
                    },
                  ),
                )
              : Center(
                  child: Text('Data not found'),
                ),
        ],
      ),
    );
  }
}
