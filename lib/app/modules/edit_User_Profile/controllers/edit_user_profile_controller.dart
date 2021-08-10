import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../../global_widgets/message.dart';
import '../../../models/response.dart';
import '../../../models/user/user.dart';
import '../../../routes/app_pages.dart';
import '../../initLoad/controllers/init_load_controller.dart';
import '../Provider/editprofile_provider.dart';
import '../Provider/editprofile_providerImpl.dart';

class EditUserProfileController extends GetxController {
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController address;
  late TextEditingController gender;
  late EditprofileProvider _editprofileProvider;

  late InitLoadController _global;
  List<String> gendersList = ["Male", "Female"];
  final Rx<bool> editProfile = false.obs;
  final editUserKey = GlobalKey<FormState>();

  @override
  void onInit() {
    _global = Get.find<InitLoadController>();
    name = TextEditingController(text: _global.currentUser.name);
    phone = TextEditingController(text: _global.currentUser.phone);
    address = TextEditingController(text: _global.currentUser.address);
    gender = TextEditingController(text: _global.currentUser.gender);
    print(_global.currentUser.toJson());
    _editprofileProvider = Get.find<EditprofileProviderImpl>();
    // getData();
    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    phone.dispose();
    address.dispose();
    gender.dispose();
  }

  // getData() {
  //   _currentUser = _global.currentUser;
  //   name.text = _currentUser.name!;
  //   phone.text = _currentUser.phone ?? ' ';
  //   address.text = _currentUser.address ?? ' ';
  //   gender.text = _currentUser.gender ?? ' ';
  // }

  void changeGender(String? value) {
    gender.text = value!;
  }

  String? nameValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    return null;
  }

  String? phoneValidator(String? value) {
    if (value != null) {
      if (!GetUtils.isPhoneNumber(value)) {
        return 'Please enter a valid email';
      }
    }

    return null;
  }

  String? addressValidator(String? value) {
    if (value != null) {
      if (GetUtils.isLengthBetween(value, 5, 32))
        return 'Address must be between 5 to 32 characters.';
    }

    return null;
  }

  String? genderValidator(String? value) {
    if (value != null) {
      if (!gendersList.contains(value)) return 'Invalid gender.';
    }

    return null;
  }

  void _changeEditProfileState() => editProfile.value = !editProfile.value;

  Future editUserProfile() async {
    _changeEditProfileState();
    try {
      // if (editUserKey.currentState!.validate()) {
      final user = User(
        name: name.text.trim(),
        phone: phone.text.trim(),
        address: address.text.trim(),
        gender: gender.text.trim(),
      ).toJson();
      ResponseModel? response =
          await _editprofileProvider.userProfile(data: user);

      FlashMessage(response!.state,
          message: response.message, displayOnSuccess: true);
      if (response.state) {
        _global.updateUser(response.user!);
        Get.offAllNamed(Routes.USER_PROFILE);
      }
      // }
    } catch (e) {
      print(e);
    }
    _changeEditProfileState();
  }
}
