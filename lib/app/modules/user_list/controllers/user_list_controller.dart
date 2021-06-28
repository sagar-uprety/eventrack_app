import 'package:eventrack_app/app/models/user/user.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {
  List<User> users = [
    User(
        profileImage:
            "https://oesexportimport.com/wp-content/uploads/2020/07/user1.jpg",
        name: "Rose Watson",
        email: "rosewatson@example.com",
        phone: "+977 9863556656",
        address: "New York",
        gender: "Female"),
    User(
        profileImage:
            "https://platforms.tqnee.com/ta3ref/wp-content/uploads/2019/05/74sByqd.jpg",
        name: "John Peterson",
        email: "johnpeter57@example.com",
        phone: "+977 9867849634",
        address: "Washington Dc",
        gender: "Male"),
    User(
        profileImage: "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg",
        name: "Brooke White",
        email: "whitebrroke5677@example.com",
        phone: "+977 9867849634",
        address: "London",
        gender: "Female"),
  ];

  bool? showSearchBar;
  @override
  void onInit() {
    showSearchBar = true;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
