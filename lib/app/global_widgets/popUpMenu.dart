import 'package:flutter/material.dart';

import '../models/widget_models/actionItem.dart';

class ETPopUpMenu extends StatelessWidget {
  final List<ActionItemModel> items;

  ///Takes list of data to display on the `PopupMenuButton`
  ///
  ///Example:
  ///ActionItemModel(
  ///  icon: Icons.delete,
  ///  title: 'Remove',
  ///  onSelected: () => print('Remove this User.'),
  ///);
  ETPopUpMenu(this.items);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (int i) => items[i].onSelected(),
      icon: Icon(
        Icons.more_vert,
        color: Colors.grey,
        size: 32,
      ),
      itemBuilder: (_) {
        return List.generate(
          items.length,
          (i) => _popUpItem(items[i], i),
        );
      },
    );
  }

  PopupMenuEntry<int> _popUpItem(ActionItemModel item, int i) {
    return PopupMenuItem(
      value: i,
      child: ListTile(
        leading: Icon(item.icon),
        title: Text(item.title),
        contentPadding: EdgeInsets.all(0),
      ),
    );
  }
}
