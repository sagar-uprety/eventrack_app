import 'package:eventrack_app/app/models/response.dart';
import 'package:eventrack_app/app/models/user/user.dart';
import 'package:eventrack_app/app/modules/initLoad/controllers/init_load_controller.dart';
import 'package:eventrack_app/app/modules/userdashboard/provider/user_dashboard_impl.dart';
import 'package:eventrack_app/app/modules/userdashboard/provider/user_provider.dart';
import 'package:get/get.dart';

import '../../../models/event/event.dart';

class UserdashboardController extends GetxController {
  late List<Event> events;
  late UserDashboardProvider dashboardProvider;
  late RxList<Event> myFavourite;
  late InitLoadController global;

  @override
  void onInit() async {
    global = Get.find<InitLoadController>();
    dashboardProvider = Get.find<UserProviderImpl>();
    myFavourite = <Event>[].obs;
    events = global.events;
    print(
        'User: ${global.currentUser.toJson()}\n\n\n Organizaiton: ${global.organization.toJson()}\n\n\n First Event: ${global.events.length}');
    super.onInit();
   
  }


  getMyFavourite()async{
    try{
      print('object');
      ResponseModel? events = await dashboardProvider.getMyFavouriteEvents();
      if(events!.state){
        print('MyFavourite Events found');
        myFavourite.value = events.eventList!;
      }
      else{
        print('My Favourite Events not found');
      }
    }catch (e) {
      print(e);
    }
  }
}
