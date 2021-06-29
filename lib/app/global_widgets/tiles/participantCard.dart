import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../models/user/user.dart';
import '../../models/widget_models/actionItem.dart';
import '../card.dart';
import '../popUpMenu.dart';
import '../slidable.dart';

class ParticipantCard extends StatelessWidget {
  const ParticipantCard(this.user, {Key? key}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return ETSlidableCard(
      child: ETCard(
        argument: user,
        height: 70,
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.profileImage!),
              radius: 26,
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
                    ],
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
      ),
      actions: [
        ETPopUpMenu(
          [
            ActionItemModel(
              icon: Icons.delete,
              title: 'Remove',
              onSelected: () => print('Remove this User.'),
            ),
          ],
        ),
      ],
    );
  }
}
