import 'package:flutter/material.dart';

class ETScaffold extends StatelessWidget {
  ETScaffold({
    Key? key,
    required this.body,
    this.appBar,
    this.drawer,
    this.resizeToAvoidBottomInset = true,
  }) : super(key: key);

  final Widget body;
  final AppBar? appBar;
  final Drawer? drawer;
  final bool resizeToAvoidBottomInset;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: body,
      ),
    );
  }
}
