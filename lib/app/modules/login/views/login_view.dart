import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/bottomSheet.dart';
import '../../../global_widgets/button.dart';
import '../../../global_widgets/formField.dart';
import '../../../global_widgets/scaffold.dart';
import '../../../routes/app_pages.dart';
import '../../../utilities/colors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final controller = Get.find<LoginController>();
  final loginFormKey = GlobalKey<FormState>();
  final bottomSheetFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ETScaffold(
      color: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: ETAppBar(
        title: 'Login',
        hasLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              height: 200.0,
              image: AssetImage('assets/images/2.png'),
            ),
            Form(
              key: loginFormKey,
              child: Column(
                children: [
                  FormInputField(
                    key: ValueKey('email'),
                    controller: controller.email,
                    label: 'Email',
                    validator: controller.emailValidator,
                  ),
                  Obx(
                    () => FormInputField(
                      key: ValueKey('password'),
                      controller: controller.password,
                      label: 'Pasword',
                      obscureText: controller.obscurePassword.value,
                      suffixIcon: !controller.obscurePassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onClickedSuffix: controller.changePasswordObscurity,
                      validator: controller.passwordValidator,
                    ),
                  ),
                  Obx(
                    () => !controller.logging.value
                        ? ETElevatedButton(
                            childText: 'Login',
                            onPressed: () async {
                              if (loginFormKey.currentState!.validate()) {
                                await controller.login();
                              }
                            }).paddingOnly(top: 12)
                        : CircularProgressIndicator(),
                  ),
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
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: AppColors.transparent,
                      builder: (_) => ETBottomSheet(
                        child: Form(
                          key: bottomSheetFormKey,
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
                              ETElevatedButton(
                                childText: 'Get Token',
                                onPressed: () async {
                                  if (bottomSheetFormKey.currentState!
                                      .validate()) {
                                    await controller.getToken();
                                  }
                                },
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
                    Get.offNamed(Routes.SIGNUP);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
