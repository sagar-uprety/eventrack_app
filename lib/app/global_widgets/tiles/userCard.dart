import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../models/user/user.dart';
import '../../models/widget_models/actionItem.dart';
import '../../utilities/colors.dart';
import '../card.dart';
import '../popUpMenu.dart';
import '../slidable.dart';

class UserCard extends StatelessWidget {
  const UserCard(this.user, {Key? key}) : super(key: key);
  final User user;

  String getStatus() {
    if (!user.isVerified!) return 'Unverified';
    if (!user.blockStatus!.isBlocked) return 'Blocked';
    return "Verified";
  }

  Color getColor() {
    if (!user.isVerified!) return AppColors.dark50;
    if (!user.blockStatus!.isBlocked) return AppColors.red;
    return AppColors.green;
  }

  @override
  Widget build(BuildContext context) {
    return ETSlidableCard(
      child: ETCard(
        argument: user,
        height: 90,
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.profileImage!),
              radius: 32,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          '${user.name!}',
                          style: Get.textTheme.headline6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Chip(
                        label: Text(
                          getStatus(),
                          style: Get.textTheme.button!.copyWith(fontSize: 12),
                        ),
                        backgroundColor: getColor(),
                        labelPadding: EdgeInsets.symmetric(horizontal: 4),
                        elevation: 1,
                      ),
                    ],
                  ),
                  Text(
                    '${user.id!}',
                    style: Get.textTheme.subtitle2,
                  ),
                  Text(
                    '${user.email!}',
                    style: Get.textTheme.subtitle2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ).paddingOnly(left: 12),
            ),
          ],
        ).paddingSymmetric(horizontal: 10, vertical: 4),
      ).paddingSymmetric(horizontal: 24, vertical: 8),
      actions: [
        ETPopUpMenu(
          [
            ActionItemModel(
              icon: Icons.block,
              title: 'Block',
              onSelected: () => print('Block this User.'),
            ),
            ActionItemModel(
              icon: Icons.delete,
              title: 'Remove',
              onSelected: () => print('Delete this User.'),
            ),
          ],
        ),
      ],
    );
  }
}
