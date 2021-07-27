import 'package:eventrack_app/app/global_widgets/tiles/eventCard.dart';
import 'package:eventrack_app/app/modules/organizationProfile/controllers/organization_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrganizationProfileTab2 extends GetView<OrganizationProfileController> {
  const OrganizationProfileTab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: false,
      itemCount: controller.createdEventList.length,
      itemBuilder: (_, i) => EventCard(controller.createdEventList[i]),
    );
  }
}
