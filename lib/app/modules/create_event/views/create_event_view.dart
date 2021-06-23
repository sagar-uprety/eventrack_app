import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/app_drawer.dart';
import '../../../global_widgets/bottomSheet.dart';
import '../../../global_widgets/button.dart';
import '../../../global_widgets/formField.dart';
import '../../../routes/app_pages.dart';
import '../../../utilities/colors.dart';
import '../../../utilities/extensions.dart';
import '../controllers/create_event_controller.dart';
import 'categoryBar.dart';

class CreateEventView extends GetView<CreateEventController> {
  final controller = Get.find<CreateEventController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ETAppBar(
        title: 'Create Your Event',
        addBackButton: true,
      ),
      drawer: buildAppDrawer(),
      body: Form(
        key: controller.key,
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
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (controller.stepIndex.value == 0)
                    RoundedRectangularButton(
                      childText: 'Next',
                      onPressed: () {
                        if (controller.validateForm1()) onStepContinue!();
                      },
                    ),
                  if (controller.stepIndex.value == 1)
                    RoundedRectangularButton(
                      childText: 'Submit',
                      onPressed: controller.submit,
                    ),
                  TextButton(
                    onPressed: onStepCancel!,
                    child: Text(
                      'Back',
                      style: Get.textTheme.button!.copyWith(
                          color: AppColors.dark65, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
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
            () => ListTile(
              leading: RoundedRectangularButton(
                childText: 'Pick a Date',
                color: AppColors.dark50,
                onPressed: () {
                  controller.pickDate(context);
                },
              ),
              title: Text(
                controller.formattedDate.length != 0
                    ? controller.formattedDate.length == 1
                        ? controller.formattedDate[0]
                        : 'From: ' +
                            controller.formattedDate[0] +
                            '\nTo: ' +
                            controller.formattedDate[1]
                    : '',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: AppColors.dark80),
              ),
            ).paddingSymmetric(vertical: 8),
          ),
          Obx(
            () => ListTile(
              leading: RoundedRectangularButton(
                childText: 'Pick Time',
                color: AppColors.dark50,
                onPressed: () {
                  controller.pickTime(context);
                },
              ),
              title: controller.formattedTime.length != 0
                  ? Text(
                      'From: ' +
                          controller.formattedTime[0] +
                          '\nTo: ' +
                          controller.formattedTime[1],
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: AppColors.dark80),
                    )
                  : Center(),
            ).paddingSymmetric(vertical: 8),
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
          RoundedRectangularButton(
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
