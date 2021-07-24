import 'package:eventrack_app/app/global_widgets/button.dart';
import 'package:eventrack_app/app/routes/app_pages.dart';
import 'package:eventrack_app/app/services/shared_prefs.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            MaterialButton(
                  child: Text('Logout'),
                  onPressed: () async{
                      await SharedPreference.deleteAuthState().whenComplete(()async{
                        print('done');
                        await SharedPreference.getAuthState();
                        final snackBar = SnackBar(
                          content: Text('You have been logged out'),
                          duration: Duration(seconds: 1),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                      Get.offNamed(Routes.SIGNUP);
                    // Get.offAndToNamed(Routes.LOGIN);
                  }
                ).paddingOnly(top: 12),
          ],
        ),
      ),
    );
  }
}
