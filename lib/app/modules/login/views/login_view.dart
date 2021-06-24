import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/bottomSheet.dart';
import '../../../global_widgets/button.dart';
import '../../../global_widgets/formField.dart';
import '../../../routes/app_pages.dart';
import '../../../utilities/colors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ETAppBar(
        title: 'Login',
        hasLeading: false,
      ),
      body: Column(
        children: [
          Form(
            key: controller.formKey,
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
          ).paddingOnly(top: 24, bottom: 10, right: 12, left: 12),
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
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: AppColors.transparent,
                    builder: (_) => ETBottomSheet(
                      child: Form(
                        key: controller.bottomSheetFormKey,
                        child: Column(
                          children: [
                            Text(
                              'Enter your Account Email',
                              style: Get.textTheme.headline5!
                                  .copyWith(color: AppColors.dark80),
                            ),
                            FormInputField(
                              key: ValueKey('email'),
                              label: 'Enter Your Email',
                              controller: controller.bottomSheetEmail,
                              validator: controller.emailValidator,
                            ).paddingSymmetric(vertical: 14),
                            RoundedRectangularButton(
                              childText: 'Get Token',
                              onPressed: controller.getToken,
                            )
                          ],
                        ),
                      ).paddingOnly(top: 30),
                    ),
                  );
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
