import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../../../pickers/filePicker.dart';

class CreateOrganizationController extends GetxController {
  late GlobalKey<FormState> formKey;
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController description;
  late TextEditingController phone;
  late TextEditingController website;
  late TextEditingController docPath;

  File? _document;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    name = TextEditingController();
    email = TextEditingController();
    description = TextEditingController();
    phone = TextEditingController();
    website = TextEditingController();
    docPath = TextEditingController();
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
    phone.dispose();
    website.dispose();
    docPath.dispose();
  }

  void changeDocument(File doc) {
    docPath.text = doc.path.split('/').last;
    _document = doc;
  }

  Future pickFile() async {
    var file = await ETFilePicker.selectADocumentFile();
    if (file != null) changeDocument(File(file.path!));
  }

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

  String? documentValidator(String? value) {
    if (_document!.path.isEmpty) return 'This field cannot be empty';
    if (!GetUtils.isPDF(_document!.path))
      return "Please upload a valid PDF file.";
    return null;
  }

  Future submit() async {
    if (formKey.currentState!.validate()) print('Data Validated.');
  }
}
