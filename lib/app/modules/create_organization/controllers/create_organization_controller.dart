import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../../../global_widgets/message.dart';
import '../../../models/organization/organization.dart';
import '../../../models/response.dart';
import '../../../models/user/user.dart';
import '../../../routes/app_pages.dart';
import '../../initLoad/controllers/init_load_controller.dart';
import '../providers/create_organization_provider.dart';
import '../providers/create_organization_providerImpl.dart';

class CreateOrganizationController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController description;
  late TextEditingController phone;
  late TextEditingController address;
  late TextEditingController website;
  // late TextEditingController docPath;
  // File? _document;

  late CreateOrganizationProvider _provider;
  late InitLoadController _global;
  final RxBool saving = false.obs;

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    description = TextEditingController();
    phone = TextEditingController();
    address = TextEditingController();
    website = TextEditingController();

    // docPath = TextEditingController();

    _provider = Get.find<CreateOrganizationProviderImpl>();
    _global = Get.find<InitLoadController>();
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
    description.dispose();
    address.dispose();
    phone.dispose();
    website.dispose();
    // docPath.dispose();
  }

  void _toggleSavingState() => saving.value = !saving.value;

  // void changeDocument(File doc) {
  //   docPath.text = doc.path.split('/').last;
  //   _document = doc;
  // }

  // Future pickFile() async {
  //   var file = await ETFilePicker.selectADocumentFile();
  //   if (file != null) changeDocument(File(file.path!));
  // }

  String? nameValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    return null;
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    if (!GetUtils.isEmail(value)) return 'Please enter a valid email.';
    return null;
  }

  String? descriptionValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    if (!GetUtils.isLengthBetween(value, 32, 100))
      return 'Description must be between 32 to 100 characters.';
    return null;
  }

  String? phoneValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    if (!GetUtils.isPhoneNumber(value))
      return 'Please enter a valid phone number.';
    return null;
  }

  String? websiteValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty';
    if (!GetUtils.isURL(value)) return 'Please enter a valid web address';
    return null;
  }

  String? addressValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty';
    if (!GetUtils.isLengthBetween(value, 8, 100))
      return 'Address must be between 8 to 100 characters.';
    return null;
  }

  // String? documentValidator(String? value) {
  //   if (_document!.path.isEmpty) return 'This field cannot be empty';
  //   if (!GetUtils.isPDF(_document!.path))
  //     return "Please upload a valid PDF file.";
  //   return null;
  // }

  Future submit() async {
    _toggleSavingState();
    print(saving.value);
    try {
      Organization newOrganization = Organization(
        name: name.text.trim(),
        email: email.text.trim().toLowerCase(),
        description: description.text.trim(),
        contact: [phone.text.trim()],
        address: address.text.trim(),
        website: website.text.trim().toLowerCase(),
      );
      ResponseModel? res = await _provider.createOrganization(
          // Dio.FormData.fromMap({
          //   ...newOrganization,
          //   'documentFile': await Dio.MultipartFile.fromFile(_document!.path,
          //       filename: _document!.path.split('/').last)
          // }),
          newOrganization.toJson());
      FlashMessage(res!.state, message: res.message);
      if (res.state) {
        _global.updateOrganization(res.organization!);
        _global.updateUser(User.fromJson({
          ..._global.currentUser.toJson(),
          'organization': res.organization!.id
        }));
        Get.offNamed(Routes.ORGANIZATION_PROFILE, arguments: res.organization);
      }
    } on Exception catch (e) {
      print(e);
    }
    _toggleSavingState();
    print(saving.value);
  }
}
