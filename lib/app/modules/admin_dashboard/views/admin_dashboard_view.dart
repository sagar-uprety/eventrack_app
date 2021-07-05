import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/app_drawer.dart';
import '../controllers/admin_dashboard_controller.dart';
import 'overviewContainer.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ETAppBar(
        title: 'Home',
      ),
      drawer: buildAppDrawer(),
      body: ListView(
        children: [
          OverviewContainer(
            title: 'Users',
            items: controller.user,
          ),
          OverviewContainer(
            title: 'Events',
            items: controller.event,
          ),
          OverviewContainer(
            title: 'Organizations',
            items: controller.organization,
          ),
        ],
      ).paddingOnly(bottom: 12),
    );
  }
}
