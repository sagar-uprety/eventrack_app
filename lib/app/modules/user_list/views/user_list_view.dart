import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/dialog_box.dart';
import '../../../utilities/colors.dart';
import '../controllers/user_list_controller.dart';
import 'user_list.dart';

class UserListView extends GetView<UserListController> {
  final UserListController userListController = Get.find<UserListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ETAppBar(
          addBackButton: true,
          title: 'Users',
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => print('Search Icon Pressed'),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: userListController.users.length,
          itemBuilder: (context, index) {
            return Slidable(
              actionPane: SlidableScrollActionPane(),
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                title: UserListCard(
                  username: '${userListController.users[index].username}',
                  email: '${userListController.users[index].email}',
                  profileImage:
                      '${userListController.users[index].profileImage}',
                ),
              ),
              key: Key(userListController.users[index].email),
              actionExtentRatio: 0.25,
              secondaryActions: <Widget>[
                IconSlideAction(
                  color: AppColors.background,
                  iconWidget: Icon(
                    Icons.more_horiz,
                  ),
                  caption: "More",
                  onTap: () async {
                    print('archive');
                    return showDialog(
                      context: context,
                      builder: (_) => ETDialog(
                        'Do you want delete this user?',
                        type: AlertType.Warning,
                        onProceed: () => print('Proceed'),
                      ),
                    );
                  },
                ),
                IconSlideAction(
                  color: AppColors.background,
                  iconWidget: Icon(
                    Icons.close_rounded,
                    size: 26,
                  ),
                  caption: "Cancel",
                  onTap: () async {
                    Get.back();
                  },
                ),
              ],
              dismissal: SlidableDismissal(
                child: SlidableDrawerDismissal(),
                onDismissed: (actiontype) {
                  print('deleted');
                },
              ),
            );
          },
        ));
  }
}
