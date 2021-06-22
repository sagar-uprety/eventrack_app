import 'package:eventrack_app/app/modules/organizationProfile/views/organization_profile2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../utilities/colors.dart';
import '../controllers/organization_profile_controller.dart';

class OrganizationProfileView extends GetView<OrganizationProfileController> {
  static get hasImage => true;
  final String? image = hasImage
      ? 'https://assets.teenvogue.com/photos/5f2c1960c2eecf5e1652a0f6/3:2/w_2532,h_1688,c_limit/00-story-euphoria.jpg'
      : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ETAppBar(
        hasBackButton: true,
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
              color: AppColors.dark25,
            ),
            child:
                !(image != null || image != '') ? Text('EventTrack') : Center(),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: OrganizationProfile2(),
              );
            },
          ),
        ],
      ),
    );
  }
}
