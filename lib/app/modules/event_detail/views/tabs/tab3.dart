import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../global_widgets/googleMap.dart';
import '../../../../utilities/colors.dart';
import '../../controllers/event_detail_controller.dart';

class EventDetailTab3 extends GetView<EventDetailController> {
  const EventDetailTab3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Event Location',
          style: Get.textTheme.headline5!
              .copyWith(fontWeight: FontWeight.w700, color: AppColors.dark80),
        ).paddingSymmetric(horizontal: 20, vertical: 8),
        Row(
          children: [
            Icon(Icons.location_on).paddingOnly(right: 5),
            Text(
              controller.event.location!.location,
              style: Get.textTheme.bodyText1!.copyWith(fontSize: 20),
            ),
          ],
        ).paddingSymmetric(horizontal: 20, vertical: 12),
        SizedBox(
          width: double.infinity,
          height: Get.height * 0.5,
          child: ETGoogleMap(
            onMapCreated: controller.createMap,
            myLocationEnabled: false,
            markedCoordinates: LatLng(
              controller.event.location!.latitude,
              controller.event.location!.longitude,
            ),
          ),
        ),
      ],
    );
  }
}
