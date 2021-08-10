import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'appBar.dart';

class ETScaffold extends StatelessWidget {
  ETScaffold({
    Key? key,
    required this.body,
    this.color,
    this.appBar,
    this.drawer,
    this.resizeToAvoidBottomInset = true,
  }) : super(key: key);

  final Widget body;
  final Color? color;
  final ETAppBar? appBar;
  final Drawer? drawer;
  final bool resizeToAvoidBottomInset;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: color ?? Get.theme.scaffoldBackgroundColor,
        appBar: appBar,
        drawer: drawer,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: body,
      ),
    );
  }
}
