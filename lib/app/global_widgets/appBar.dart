import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/colors.dart';

class ETAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final TabBar? bottom;
  final bool hasButton;
  final bool addBackButton;
  final Size preferredSize;
  final List<Widget>? actions;

  ETAppBar({
    this.title,
    Key? key,
    this.bottom,
    this.actions,
    this.hasButton = true,
    this.addBackButton = false,
  })  : preferredSize =
            Size.fromHeight(56 + (bottom?.preferredSize.height ?? 0.0)),
        super(key: key);

  Widget? prefixIcon() {
    if (!hasButton) return null;
    if (addBackButton)
      return IconButton(
        onPressed: () => print('Go back.'),
        icon: Icon(
          Icons.keyboard_arrow_left,
          color: AppColors.dark65,
        ),
      );
    return IconButton(
      onPressed: () => Scaffold.of(Get.context!).openDrawer(),
      icon: Icon(
        Icons.menu_sharp,
        color: AppColors.dark10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.transparent,
      elevation: 0.6,
      shadowColor: AppColors.dark80.withOpacity(0.1),
      leading: prefixIcon(),
      title: title != null
          ? Text(
              '$title',
              style: Theme.of(context).textTheme.headline6,
            )
          : Center(),
      actions: [
        ...actions!,
        SizedBox(
          width: 12,
        )
      ],
    );
  }
}
