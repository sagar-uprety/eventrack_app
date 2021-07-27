import 'package:eventrack_app/app/global_widgets/scaffold.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/button.dart';
import '../../../global_widgets/formField.dart';
import '../../../routes/app_pages.dart';
import '../controllers/token_verifcation_controller.dart';

class TokenVerifcationView extends GetView<TokenVerifcationController> {
  @override
  Widget build(BuildContext context) {
    return ETScaffold(
      appBar: ETAppBar(
        title: 'Verify Your Token',
        hasLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/verificationotp.png',
                  height: 60,
                ).paddingOnly(top: 24, bottom: 10),
                Text(
                  'Enter the verification number',
                  style: Theme.of(context).textTheme.headline6,
                ),
                FormInputField(
                  key: ValueKey('token'),
                  label: 'Enter Token',
                  controller: controller.token,
                  validator: controller.tokenValidator,
                  maxLength: 6,
                  width: 200,
                ).paddingSymmetric(vertical: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ETElevatedButton(
                      childText: 'Verify',
                      onPressed: controller.verifyToken,
                    ),
                    ETElevatedButton(
                      childText: 'Cancel',
                      fontSize: 18,
                      isGrey: true,
                      onPressed: () => Get.toNamed(Routes.LOGIN),
                    ),
                  ],
                ).paddingOnly(top: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
