import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/init_load_controller.dart';

class InitLoadView extends GetView<InitLoadController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InitLoadController>(
      // init: InitLoadController(),
      builder: (_) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
