import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/draggableSheet.dart';
import '../../../utilities/colors.dart';
import '../controllers/event_detail_controller.dart';
import 'Button/RoundedButton.dart';
import 'tabs/tab1.dart';
import 'tabs/tab2.dart';
import 'tabs/tab3.dart';

class EventDetailView extends GetView<EventDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ETAppBar(
        addBackButton: true,
        actions: controller.myEvent
            ? [
                IconButton(
                  onPressed: controller.pickProfile,
                  iconSize: 20,
                  icon: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.dark10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                    ),
                  ),
                ),
              ]
            : null,
      ),
      body: Obx(
        () => Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.42,
              decoration: BoxDecoration(
                image: controller.event.eventProfile != null
                    ? DecorationImage(
                        image: NetworkImage(controller.event.eventProfile),
                        fit: BoxFit.cover,
                      )
                    : null,
                gradient: RadialGradient(
                  center: Alignment.topRight,
                  radius: 2.0,
                  colors: <Color>[
                    AppColors.dark65,
                    AppColors.dark10,
                  ],
                ),
              ),
              child: !(controller.event.eventProfile != null)
                  ? Center(
                      child: Text(
                        controller.event.title.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headline1!
                            .copyWith(color: AppColors.dark80),
                      ).paddingAll(20),
                    )
                  : Center(),
            ),
            DraggableSheet(
              tabIcons: [
                Icons.description,
                if (controller.myEvent) Icons.people,
                Icons.location_on,
              ],
              tabs: [
                EventDetailTab1(),
                if (controller.myEvent) EventDetailTab2(),
                EventDetailTab3(),
              ],
            ),
            // if (!controller.myEvent)
            //   Obx(
            //     () => Align(
            //       alignment: Alignment.bottomCenter,
            //       child: !controller.registering.value
            //           ? RoundButton(
            //               text: controller.registered.value
            //                   ? 'Registered'
            //                   : "Register",
            //               onPress: controller.registerforevent)
            //           : CircularProgressIndicator(),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
