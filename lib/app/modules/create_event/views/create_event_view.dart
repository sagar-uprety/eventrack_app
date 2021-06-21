import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/app_drawer.dart';
import '../../../global_widgets/bottomSheet.dart';
import '../../../global_widgets/button.dart';
import '../../../global_widgets/formField.dart';
import '../../../utilities/extensions.dart';
import '../controllers/create_event_controller.dart';
import 'categoryBar.dart';

class CreateEventView extends GetView<CreateEventController> {
  final controller = Get.find<CreateEventController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ETAppBar(
        'Create Your Event',
        hasBackButton: true,
      ),
      drawer: buildAppDrawer(),
      body: Form(
        key: controller.key,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: [
            FormInputField(
              key: ValueKey('eventName'),
              controller: controller.eventName,
              label: 'Event Name',
              validator: controller.eventNameValidator,
            ),
            FormInputField(
              key: ValueKey('description'),
              controller: controller.description,
              label: 'Description',
              maxLines: 3,
              maxLength: 100,
              validator: controller.descriptionValidator,
            ),
            FormInputField(
              key: key,
              label: 'Categories',
              controller: controller.categoriesText,
              readOnly: true,
              suffixIcon: Icons.category,
              validator: controller.categoriesValidator,
            ).changeToButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (_) => ETBottomSheet(
                  child: Wrap(
                    children: [
                      for (var i = 0; i < controller.categoriesList.length; i++)
                        Category(
                          controller.categoriesList[i],
                          onChanged: controller.changeCategoriesList,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: RoundedRectangularButton(
                childText: 'Pick a Date',
                onPressed: () => print('Pick a Date'),
              ),
            ).paddingSymmetric(horizontal: 10, vertical: 8),
            RoundedRectangularButton(
              childText: 'Submit',
              onPressed: controller.submit,
            ),
          ],
        ),
      ),
    );
  }
}
