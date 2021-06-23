import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
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

  final List<Widget> _tabs = [
    OrganizationProfileTab1(),
    OrganizationProfileTab2(),
    OrganizationProfileTab3(),
  ];

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
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    color: AppColors.background,
                  ),
                  child: new DefaultTabController(
                    length: _tabs.length,
                    initialIndex: 0,
                    child: new Column(
                      children: <Widget>[
                        new TabBar(
                          indicatorColor: AppColors.dark25,
                          indicatorWeight: 3.0,
                          labelStyle: Get.textTheme.bodyText1!
                              .copyWith(fontWeight: FontWeight.w600),
                          labelPadding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                          labelColor: AppColors.dark80,
                          unselectedLabelColor: AppColors.dark50,
                          onTap: controller.changeTab,
                          tabs: <Widget>[
                            Tab(text: 'ABOUT'),
                            Tab(text: 'TAB2'),
                            Tab(text: 'TAB3'),
                          ],
                        ),
                        Obx(
                          () => _tabs[controller.selectedTab.value],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
