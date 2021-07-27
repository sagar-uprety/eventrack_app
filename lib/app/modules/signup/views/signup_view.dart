import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/button.dart';
import '../../../global_widgets/formField.dart';
import '../../../global_widgets/scaffold.dart';
import '../../../routes/app_pages.dart';
import '../../../utilities/colors.dart';
import '../controllers/signup_controller.dart';

class SignUpView extends GetView<SignupController> {
  final signupController = Get.find<SignupController>();
  final signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ETScaffold(
      color: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: ETAppBar(
        title: 'Signup',
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
              key: signupFormKey,
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
                  Obx(
                    () => FormInputField(
                      key: ValueKey('password'),
                      controller: controller.password,
                      obscureText: controller.obscurePassword.value,
                      suffixIcon: !controller.obscurePassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onClickedSuffix: controller.changePasswordObscurity,
                      label: 'Pasword',
                      validator: controller.passwordValidator,
                    ),
                  ),
                  Obx(
                    () => !controller.signing.value
                        ? ETElevatedButton(
                            childText: 'Sign Up',
                            onPressed: () async {
                              if (signupFormKey.currentState!.validate()) {
                                await signupController.signup();
                              }
                            },
                          ).paddingOnly(top: 12)
                        : CircularProgressIndicator(),
                  ),
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
                  onPressed: () async {
                    // await SharedPreference.saveAuthState();
                    // await SharedPreference.getAuthState();
                    // Get.toNamed(Routes.HOME);
                    Get.offNamed(Routes.LOGIN);
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
