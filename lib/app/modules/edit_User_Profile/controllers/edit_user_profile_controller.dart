import 'package:eventrack_app/app/global_widgets/message.dart';
import 'package:eventrack_app/app/models/response.dart';
import 'package:eventrack_app/app/models/user/user.dart';
import 'package:eventrack_app/app/modules/edit_User_Profile/Provider/editprofile_provider.dart';
import 'package:eventrack_app/app/modules/edit_User_Profile/Provider/editprofile_providerImpl.dart';
import 'package:eventrack_app/app/modules/initLoad/controllers/init_load_controller.dart';
import 'package:eventrack_app/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

class EditUserProfileController extends GetxController {
  final profileImage =
      "https://oesexportimport.com/wp-content/uploads/2020/07/user1.jpg";
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController address;
  late TextEditingController gender;
  late EditprofileProvider _editprofileProvider;

  late InitLoadController _global;
  late User _currentUser = User();
  List<String> gendersList = ["Male", "Female"];
  final Rx<bool> editProfile = false.obs;
  final editUserKey = GlobalKey<FormState>();

  @override
  void onInit() {
    _global = Get.find<InitLoadController>();
    name = TextEditingController();
    phone = TextEditingController();
    address = TextEditingController();
    gender = TextEditingController();
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

  void _changeEditProfileState() => editProfile.value = !editProfile.value;

  Future editUserProfile() async {
    _changeEditProfileState();
    try {
      if (editUserKey.currentState!.validate()) {
        final user = User(
          name: name.text.trim(),
          phone: phone.text.trim(),
          address: address.text.trim(),
          gender: gender.text.trim(),
        ).toJson();
        print(user);
        ResponseModel? response =
            await _editprofileProvider.userProfile(data: user);

        FlashMessage(response!.state,
            message: response.message, displayOnSuccess: true);
        if (response.state) {
          _currentUser = response.user!;
          _global.updateUser(response.user!);
          Get.offAllNamed(Routes.USER_PROFILE);
        }
      }
    } catch (e) {
      print(e);
    }
    _changeEditProfileState();
  }

  String? nameValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    return null;
  }

  String? phoneValidator(String? value) {
    if (value!.isNotEmpty) if (!GetUtils.isPhoneNumber(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? addressValidator(String? value) {
    if (value!.isNotEmpty) if (GetUtils.isLengthBetween(value, 5, 32))
      return 'Address must be between 5 to 32 characters.';

    return null;
  }

  String? genderValidator(String? value) {
    if (value!.isNotEmpty) if (!gendersList.contains(value))
      return 'Invalid gender.';
    return null;
  }
}
