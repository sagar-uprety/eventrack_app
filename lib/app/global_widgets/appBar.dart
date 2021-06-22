import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilities/colors.dart';

class ETAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final TabBar? bottom;
  final bool hasBackButton;
  final Size preferredSize;
  final List<Widget>? actions;

  ETAppBar({
    this.title,
    Key? key,
    this.bottom,
    this.actions,
    this.hasBackButton = false,
  })  : preferredSize =
            Size.fromHeight(56 + (bottom?.preferredSize.height ?? 0.0)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.transparent,
      elevation: 0.6,
      shadowColor: AppColors.dark80.withOpacity(0.1),
      leading: hasBackButton
          ? IconButton(
              onPressed: () => print('Go back.'),
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: AppColors.dark10,
                size: 32,
              ),
            )
          : IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.menu_sharp,
                color: AppColors.dark10,
                size: 32,
              ),
            ),
      title: title != null
          ? Text(
              '$title',
              style: Theme.of(context).textTheme.headline6,
            )
          : Center(),
      actions: actions,
    );
  }
}
