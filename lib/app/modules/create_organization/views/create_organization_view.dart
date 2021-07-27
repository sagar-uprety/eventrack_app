import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/button.dart';
import '../../../global_widgets/formField.dart';
import '../../../global_widgets/scaffold.dart';
import '../controllers/create_organization_controller.dart';

class CreateOrganizationView extends GetView<CreateOrganizationController> {
  @override
  Widget build(BuildContext context) {
    return ETScaffold(
      appBar: ETAppBar(
        addBackButton: true,
        title: "Create Your Organization",
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              FormInputField(
                key: ValueKey('Organization Name'),
                controller: controller.name,
                label: 'Organization Name',
                validator: controller.nameValidator,
              ),
              FormInputField(
                key: ValueKey('email'),
                controller: controller.email,
                label: 'Email',
                validator: controller.emailValidator,
              ),
              FormInputField(
                key: ValueKey('description'),
                controller: controller.description,
                label: 'Description',
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                maxLength: 100,
                validator: controller.descriptionValidator,
              ),
              FormInputField(
                key: ValueKey('phone'),
                controller: controller.phone,
                label: 'Phone',
                keyboardType: TextInputType.phone,
                validator: controller.phoneValidator,
              ),
              FormInputField(
                key: ValueKey('address'),
                controller: controller.address,
                label: 'Address',
                keyboardType: TextInputType.streetAddress,
                validator: controller.addressValidator,
              ),
              FormInputField(
                key: ValueKey('website'),
                controller: controller.website,
                label: 'Website URl',
                validator: controller.websiteValidator,
              ),
              // FormInputField(
              //   key: ValueKey('document'),
              //   controller: controller.docPath,
              //   label: 'Verification Document',
              //   helperText:
              //       'Upload a PDF file that can verify your organization.',
              //   suffixIcon: Icons.upload,
              //   validator: controller.documentValidator,
              // ).changeToButton(
              //   onPressed: () async => await controller.pickFile(),
              // ),
              Obx(
                () => !controller.saving.value
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ETElevatedButton(
                            childText: 'Create',
                            onPressed: controller.submit,
                          ),
                          ETTextButton(
                            'Cancel',
                            onPressed: () => Get.back(),
                          ),
                        ],
                      )
                    : Center(child: CircularProgressIndicator()),
              ).paddingOnly(top: 20),
            ],
          ).paddingOnly(top: 20),
        ),
      ),
    );
  }
}
