import 'package:get/get.dart';

import '../../../models/user.dart';

class UserListController extends GetxController {
  //TODO: Implement UserListController

  List<User> users = [
    User(
        "https://oesexportimport.com/wp-content/uploads/2020/07/user1.jpg",
        "Rose Watson",
        "rosewatson@example.com",
        "shreya2057",
        "+977 9863556656",
        "New York",
        "Female"),
    User(
        "https://platforms.tqnee.com/ta3ref/wp-content/uploads/2019/05/74sByqd.jpg",
        "John Peterson",
        "johnpeter57@example.com",
        "shreya2057",
        "+977 9867849634",
        "Washington Dc",
        "Male"),
    User(
        "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg",
        "Brooke White",
        "whitebrroke5677@example.com",
        "shreya2057",
        "+977 9867849634",
        "London",
        "Female"),
    User(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN3mnIihmTBel8INtuKaWBE2k1tqoQnlgRWOVUhvQGpacS65DbM0VTLBw0-m20vkcxmYw&usqp=CAU",
        "Roman Brown",
        "brown45@example.com",
        "shreya2057",
        "+977 9867849634",
        "Paris",
        "Male"),
    User(
        "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg",
        "Annie Rock",
        "rockannie@example.com",
        "shreya2057",
        "+977 9867849634",
        "Los Angeles",
        "Female"),
    User(
        "https://oesexportimport.com/wp-content/uploads/2020/07/user1.jpg",
        "Christina Bruss",
        "chrisbruss15@example.com",
        "shreya2057",
        "+977 9867849634",
        "Chicago",
        "Female"),
    User(
        "https://i.imgur.com/G4Eph8s.jpg",
        "Richard Danis",
        "richarddanis@example.com",
        "shreya2057",
        "+977 9867849634",
        "San Diago",
        "Male"),
  ];

  final count = 0.obs;
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
  void increment() => count.value++;
}
