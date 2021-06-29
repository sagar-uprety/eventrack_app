import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/formField.dart';
import '../../../global_widgets/tiles/userCard.dart';
import '../controllers/user_list_controller.dart';

class UserListView extends GetView<UserListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ETAppBar(
        addBackButton: true,
        title: 'Users',
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: controller.users.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return UserCard(controller.users[index]);
            },
          ).paddingOnly(top: 70, bottom: 15),
          Form(
            child: FormInputField(
              label: 'Search',
              controller: controller.searchText,
              suffixIcon: Icons.search,
              onClickedSuffix: controller.search,
            ),
          ),
        ],
      ),
    );
  }
}
