import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/button.dart';
import '../../../global_widgets/formField.dart';
import '../../../global_widgets/scaffold.dart';
import '../../../utilities/colors.dart';
import '../controllers/edit_user_profile_controller.dart';

class EditUserProfileView extends GetView<EditUserProfileController> {
  final EditUserProfileController editController =
      Get.put(EditUserProfileController());

  @override
  Widget build(BuildContext context) {
    return ETScaffold(
      appBar: ETAppBar(
        title: 'Edit Your Profile',
        addBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormInputField(
              key: ValueKey('name'),
              controller: controller.name,
              label: 'Name',
              validator: controller.nameValidator,
            ),
            FormInputField(
              key: ValueKey('phone'),
              controller: controller.phone,
              label: 'Phone',
              validator: controller.phoneValidator,
            ),
            FormInputField(
              key: ValueKey('address'),
              controller: controller.address,
              label: 'Address',
              validator: controller.addressValidator,
            ),
            _dropdown(),
            !controller.editProfile.value
                ? ETElevatedButton(
                    childText: 'Save',
                    onPressed: controller.editUserProfile,
                  ).paddingOnly(top: 24)
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _dropdown() {
    return DropdownButtonFormField<String>(
      key: ValueKey('gender'),
      // value: controller.gender.text ?? '',
      onChanged: controller.changeGender,
      icon: Icon(Icons.arrow_drop_down_outlined),
      validator: controller.genderValidator,
      decoration: InputDecoration(
        counterText: '',
        labelText: 'Gender',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: Get.textTheme.bodyText1!.copyWith(color: AppColors.dark50),
        filled: true,
        fillColor: AppColors.dark25,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.dark50, width: 2),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.red, width: 4),
        ),
        errorStyle: Get.textTheme.overline!
            .copyWith(fontSize: 14, color: AppColors.red),
        errorMaxLines: 2,
      ),
      items: controller.gendersList
          .map(
            (String gender) => DropdownMenuItem<String>(
              child: Text(gender.toString()),
              value: gender,
            ),
          )
          .toList(),
    ).paddingSymmetric(horizontal: 24, vertical: 8);
  }
}
