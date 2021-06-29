import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class ETSlidableCard extends StatelessWidget {
  const ETSlidableCard({Key? key, required this.child, required this.actions})
      : assert(actions.length >= 1, 'Actions length must be greater than 0.'),
        super(key: key);

  final Widget child;
  final List<Widget> actions;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: child,
      actionPane: SlidableScrollActionPane(),
      secondaryActions: [
        ...actions,
      ],
      actionExtentRatio: 0.25,
    );
  }
}
