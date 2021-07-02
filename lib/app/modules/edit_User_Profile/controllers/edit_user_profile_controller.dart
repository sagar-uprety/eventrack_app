import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

class EditUserProfileController extends GetxController {
  final profileImage =
      "https://oesexportimport.com/wp-content/uploads/2020/07/user1.jpg";
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController address;
  late TextEditingController gender;

  List<String> gendersList = ["Male", "Female"];

  @override
  void onInit() {
    name = TextEditingController(text: "Rose Watson");
    email = TextEditingController(text: "Some@example.com");
    phone = TextEditingController(text: "+977 9863556656");
    address = TextEditingController(text: "Kathmandu");
    gender = TextEditingController(text: "Female");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    address.dispose();
    gender.dispose();
  }

  void changeGender(String? value) {
    gender.text = value!;
  }

  String? nameValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    return null;
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    if (!GetUtils.isPhoneNumber(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? addressValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    if (GetUtils.isLengthBetween(value, 5, 32))
      return 'Address must be between 5 to 32 characters.';

    return null;
  }

  String? genderValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    if (!gendersList.contains(value)) return 'Invalid gender.';
    return null;
  }
}
