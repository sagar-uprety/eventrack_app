import 'package:eventrack_app/app/models/user.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  //TODO: Implement UserProfileController

  final user = User(
    "https://oesexportimport.com/wp-content/uploads/2020/07/user1.jpg",
    "Rose Watson", 
    "Some@example.com", 
    "shreya2057", 
    "+977 9863556656", 
    "Kathmandu", 
    "Female"
  );

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
