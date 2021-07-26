import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../global_widgets/button.dart';
import '../../controllers/organization_profile_controller.dart';

class OrganizationProfileTab1 extends GetView<OrganizationProfileController> {
  OrganizationProfileTab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(
            controller.orgData.name!, //? Organization Name
            style:
                Get.textTheme.headline4!.copyWith(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            'Jason Mark', //? Organization's address
            style:
                Get.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w500),
          ),
        ).paddingSymmetric(vertical: 8),
        Text(
          'About',
          style: Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.w600),
        ).paddingOnly(top: 12),
        Obx(
          () => Text(
            controller.orgData.description!, //? Organization's description
            maxLines: !controller.showMore.value ? 12 : null,
            style: Get.textTheme.bodyText1,
          ),
        ),
        Obx(
          () => ETTextButton(
            !controller.showMore.value ? 'Show More' : 'Show Less',
            onPressed: controller.toggleDescriptionDisplay,
          ),
        ),
        Center(
          child: ETElevatedButton(
            onPressed: () {},
            childText: 'Create Organization',
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 20);
  }
}
