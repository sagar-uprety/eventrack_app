import 'package:eventrack_app/app/global_widgets/appBar.dart';
import 'package:eventrack_app/app/global_widgets/button.dart';
import 'package:eventrack_app/app/global_widgets/formField.dart';
import 'package:eventrack_app/app/routes/app_pages.dart';
import 'package:eventrack_app/app/utilities/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignUpView extends GetView<SignupController> {
  final signupController = Get.find<SignupController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ETAppBar(title: 'Sign Up'),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                FormInputField(
                  key: ValueKey('name'),
                  controller: controller.name,
                  label: 'Name',
                  validator: controller.nameValidator,
                ),
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
                  childText: 'Sign Up',
                  onPressed: signupController.signup,
                ).paddingOnly(top: 12),
              ],
            ),
          ).paddingOnly(top: 24, bottom: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: Get.textTheme.button!
                    .copyWith(fontSize: 14, color: AppColors.dark50),
              ).paddingOnly(right: 10),
              ETTextButton(
                'Login',
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
