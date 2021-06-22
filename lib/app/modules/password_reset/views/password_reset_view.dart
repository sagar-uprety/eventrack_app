import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/password_reset_controller.dart';

class PasswordResetView extends GetView<PasswordResetController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PasswordResetView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PasswordResetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
