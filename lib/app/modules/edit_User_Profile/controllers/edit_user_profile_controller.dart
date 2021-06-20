import 'package:eventrack_app/app/models/user.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EditUserProfileController extends GetxController {
  //TODO: Implement EditUserProfileController

  final user = User(
    "https://oesexportimport.com/wp-content/uploads/2020/07/user1.jpg",
    "Rose Watson", 
    "Some@example.com", 
    "shreya2057", 
    "+977 9863556656", 
    "Kathmandu", 
    "Female"
  );


  Object? currentGender = "Female";
  List gender = [
    "Male",
    "Female"
  ];

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
}
