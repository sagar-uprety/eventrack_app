import 'package:eventrack_app/app/global_widgets/appBar.dart';
import 'package:eventrack_app/app/global_widgets/button.dart';
import 'package:eventrack_app/app/global_widgets/formField.dart';
import 'package:eventrack_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utilities/colors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ETAppBar(
        title: 'Login',
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                FormInputField(
                  key: ValueKey('email'),
                  controller: controller.email,
                  label: 'Email',
                  validator: controller.emailValidator,
                ),
                FormInputField(
                  key: ValueKey('password'),
                  controller: controller.password,
                  label: 'Pasword',
                  validator: controller.passwordValidator,
                ),
                RoundedRectangularButton(
                  childText: 'Login',
                  onPressed: loginController.login,
                ).paddingOnly(top: 12),
              ],
            ),
          ).paddingOnly(top: 24, bottom: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'Forgotten your Password?',
                style: Get.textTheme.button!
                    .copyWith(fontSize: 14, color: AppColors.dark50),
              ).paddingOnly(right: 10),
              ETTextButton(
                'Reset Password',
                onPressed: () {
                  print('reset password');
                  // Get.toNamed(Routes.SIGNUP);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style: Get.textTheme.button!
                    .copyWith(fontSize: 14, color: AppColors.dark50),
              ).paddingOnly(right: 10),
              ETTextButton(
                'Sign Up',
                onPressed: () {
                  Get.toNamed(Routes.SIGNUP);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
