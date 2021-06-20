import 'package:eventrack_app/app/models/user.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {
  //TODO: Implement UserListController

  List <User> users = [
    User(
      "https://oesexportimport.com/wp-content/uploads/2020/07/user1.jpg",
      "Rose Watson", 
      "Some@example.com", 
      "shreya2057", 
      "+977 9863556656", 
      "Kathmandu", 
      "Female"
    ),
    User(
      "https://lh3.googleusercontent.com/proxy/IIaXhCth3TPWn2G3CD42cDOFO7SzQLdQJDX2OMpO_79OWMH8H4KnIy_VH5p0mxQr4L_nNIHrMO72RoSfmbgM-USRv9yUr5qjcHPKNr9R_oDfa8_GUb-DbPMAlJB9",
      "John Peterson", 
      "Some@example.com", 
      "shreya2057", 
      "+977 9867849634", 
      "Banepa", 
      "Male"
    )
  ];

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
