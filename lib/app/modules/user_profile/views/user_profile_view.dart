import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UserProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
