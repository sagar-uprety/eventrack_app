
import 'package:eventrack_app/app/routes/app_pages.dart';
import 'package:eventrack_app/app/services/shared_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  @override
  void onInit() {
    // getUserAuthState();
    super.onInit();
  }

  getUserAuthState() async{
    var user = await SharedPreference.getAuthState() ;
    print(user);
  }

  Future logout(BuildContext context) async {
    print("Hello World");

    // await SharedPreference.deleteAuthState().whenComplete((){
    //   Get.toNamed(Routes.LOGIN);
    // });
    
    Navigator.pushNamed(context, Routes.LOGIN);
    
  }
}
