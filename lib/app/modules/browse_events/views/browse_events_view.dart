import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/browse_events_controller.dart';

class BrowseEventsView extends GetView<BrowseEventsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BrowseEventsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BrowseEventsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
