import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/bottomSheet.dart';
import '../../../global_widgets/button.dart';
import '../../../global_widgets/formField.dart';
import '../../../global_widgets/scaffold.dart';
import '../../../routes/app_pages.dart';
import '../../../utilities/colors.dart';
import '../../../utilities/extensions.dart';
import '../controllers/create_event_controller.dart';
import 'categoryBar.dart';

class CreateEventView extends GetView<CreateEventController> {
  final controller = Get.find<CreateEventController>();
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ETScaffold(
      appBar: ETAppBar(
        title: 'Create Your Event',
        addBackButton: true,
      ),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.disabled,
        child: Obx(
          () => Stepper(
            type: StepperType.horizontal,
            currentStep: controller.stepIndex.value,
            onStepCancel: () =>
                controller.stepFunction(StepFunctionType.cancel),
            onStepContinue: () =>
                controller.stepFunction(StepFunctionType.next),
            controlsBuilder: (BuildContext context,
                {VoidCallback? onStepCancel, VoidCallback? onStepContinue}) {
              return Obx(
                () => !controller.saving.value
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (controller.stepIndex.value == 0)
                            ETElevatedButton(
                              size: Size(120, 50),
                              childText: 'Next',
                              onPressed: () {
                                if (_key.currentState!.validate())
                                  onStepContinue!();
                              },
                            ),
                          if (controller.stepIndex.value == 1)
                            ETElevatedButton(
                              size: Size(120, 50),
                              childText: 'Submit',
                              onPressed: () async {
                                if (_key.currentState!.validate())
                                  await controller.submit();
                              },
                            ),
                          ETElevatedButton(
                            size: Size(120, 50),
                            childText: 'Back',
                            onPressed: onStepCancel!,
                            color: AppColors.dark65,
                          ),
                        ],
                      )
                    : Center(child: CircularProgressIndicator()),
              ).paddingSymmetric(horizontal: 10, vertical: 12);
            },
            steps: [
              _step1(context),
              _step2(context),
            ],
          ),
        ),
      ),
    );
  }

  Step _step1(context) {
    return Step(
      title: Icon(Icons.event_note),
      content: Column(
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
                        controller.selectedCategories,
                        onChanged: controller.changeCategoriesList,
                      ),
                  ],
                ),
              ),
            ),
          ),
          SwitchListTile(
            value: controller.isOneDayEvent.value,
            onChanged: controller.toggleOneDayMode,
            title: Text(
              'It is a one-day event.',
              style: Get.textTheme.overline,
            ),
            inactiveThumbColor: AppColors.dark65,
            activeColor: AppColors.blue,
            inactiveTrackColor: AppColors.dark50,
          ),
          Obx(
            () => SizedBox(
              width: 190,
              child: ListTile(
                subtitle: ETElevatedButton(
                  childText: 'Pick a Date',
                  color: AppColors.dark50,
                  onPressed: () {
                    controller.pickDate(context);
                  },
                ),
                title: Center(
                  child: controller.formattedDate.length != 0
                      ? Text(
                          controller.formattedDate.length == 1
                              ? controller.formattedDate[0]
                              : 'From: ' +
                                  controller.formattedDate[0] +
                                  '\nTo: ' +
                                  controller.formattedDate[1],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: AppColors.dark80),
                        ).paddingOnly(bottom: 10)
                      : Center(),
                ),
              ).paddingOnly(bottom: 8),
            ),
          ),
          Obx(
            () => SizedBox(
              width: 190,
              child: ListTile(
                title: controller.times.value.length != 0
                    ? Center(
                        child: Text(
                          controller.times.value[0] +
                              '-' +
                              controller.times.value[1],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: AppColors.dark80),
                        ).paddingOnly(bottom: 10),
                      )
                    : Center(),
                subtitle: ETElevatedButton(
                  childText: 'Pick Time',
                  color: AppColors.dark50,
                  onPressed: () {
                    controller.pickTime(context);
                  },
                ),
              ).paddingSymmetric(vertical: 8),
            ),
          ),
        ],
      ),
    );
  }

  Step _step2(context) {
    return Step(
      title: Icon(Icons.location_on),
      content: Column(
        children: [
          FormInputField(
            key: ValueKey('locationText'),
            label: 'Location',
            controller: controller.location,
            validator: controller.locationValidator,
          ),
          ETElevatedButton(
            color: AppColors.dark50,
            childText: 'Pick a Location',
            onPressed: () async {
              LatLng location = await Get.toNamed(Routes.LOCATION_PICKER);

              controller.setCoordinates(location);
            },
          ).paddingSymmetric(vertical: 10),
          Obx(
            () => Text(
              controller.coordinates.value != controller.origin
                  ? 'Latitude: ${controller.coordinates.value.latitude}\nLongitude: ${controller.coordinates.value.longitude}'
                  : '',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppColors.dark65),
            ).paddingSymmetric(vertical: 20),
          ),
        ],
      ),
    );
  }
}
