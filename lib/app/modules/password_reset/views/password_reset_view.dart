import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/button.dart';
import '../../../global_widgets/formField.dart';
import '../../../routes/app_pages.dart';
import '../controllers/password_reset_controller.dart';

class PasswordResetView extends GetView<PasswordResetController> {
  final PasswordResetController passwordController =
      Get.find<PasswordResetController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ETAppBar(
        title: 'Reset Your Password',
        hasLeading: false,
      ),
      body: Obx(
        () => Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/reset-password-icon.jpg',
                width: 60,
              ).paddingOnly(top: 28),
              Text(
                "Choose strong password and the one you haven't used in other accounts",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 16),
              ).paddingSymmetric(horizontal: 32, vertical: 8),
              FormInputField(
                key: ValueKey('password'),
                label: 'Enter Password',
                controller: controller.newPassword,
                validator: controller.passwordValidator,
                obscureText: controller.obscureNewPassword.value,
                suffixIcon: controller.obscureNewPassword.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                onClickedSuffix: controller.changePasswordObscurity,
              ).paddingSymmetric(horizontal: 12),
              FormInputField(
                key: ValueKey('retypedPassword'),
                label: 'Retype Password',
                controller: controller.retypedPassword,
                validator: controller.retypedPasswordValidator,
                obscureText: controller.obscureRetyped.value,
                suffixIcon: controller.obscureRetyped.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                onClickedSuffix: controller.changeRetypedObscurity,
              ).paddingSymmetric(horizontal: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedRectangularButton(
                    childText: 'Save',
                    onPressed: controller.submit,
                  ),
                  ETTextButton(
                    'Cancel',
                    underline: false,
                    fontSize: 18,
                    onPressed: () =>
                        Get.offNamedUntil(Routes.LOGIN, (route) => false),
                  ),
                ],
              ).paddingOnly(top: 20),
            ],
          ),
        ),
      ),
    );
  }
}
