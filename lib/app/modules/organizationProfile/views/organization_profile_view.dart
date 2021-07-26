import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/draggableSheet.dart';
import '../../../utilities/colors.dart';
import '../controllers/organization_profile_controller.dart';
import 'tabs/tab1.dart';
import 'tabs/tab2.dart';
import 'tabs/tab3.dart';

class OrganizationProfileView extends GetView<OrganizationProfileController> {
  //TODO: Remove `hasImage` and `image`
  static get hasImage => true;
  final String? image = hasImage
      ? 'https://assets.teenvogue.com/photos/5f2c1960c2eecf5e1652a0f6/3:2/w_2532,h_1688,c_limit/00-story-euphoria.jpg'
      : null;

  final controller = Get.find<OrganizationProfileController>();
  //TODO: create event button
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ETAppBar(
        addBackButton: true,
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.42,
            decoration: BoxDecoration(
              image: image != null
                  ? DecorationImage(
                      image: NetworkImage(image!),
                      fit: BoxFit.cover,
                    )
                  : null,
              gradient: AppColors.imageGradient(),
            ),
            child: !(image != null)
                ? Center(
                    child: Text(
                      'EventTrack'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: Get.textTheme.headline1!
                          .copyWith(color: AppColors.dark80),
                    ).paddingAll(20),
                  )
                : Center(),
          ),
          DraggableSheet(
            tabIcons: [
              Icons.event_note,
              Icons.circle,
              Icons.circle,
            ],
            tabs: [
              OrganizationProfileTab1(),
              OrganizationProfileTab2(),
              OrganizationProfileTab3(),
            ],
          )
        ],
      ),
    );
  }
}
