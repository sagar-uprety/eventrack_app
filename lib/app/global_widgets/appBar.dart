import 'package:flutter/material.dart';

class ETAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TabBar? bottom;
  final bool hasBackButton;
  final Size preferredSize;
  final List<Widget>? actions;

  ETAppBar(
    this.title, {
    Key? key,
    this.bottom,
    this.actions,
    this.hasBackButton = false,
  })  : assert(title != ''),
        preferredSize =
            Size.fromHeight(56 + (bottom?.preferredSize.height ?? 0.0)),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: hasBackButton
          ? IconButton(
              onPressed: () => print('Go back.'),
              icon: Icon(Icons.keyboard_arrow_left),
            )
          : IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu_sharp),
            ),
      title: Text(
        '$title',
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: actions,
    );
  }
}
