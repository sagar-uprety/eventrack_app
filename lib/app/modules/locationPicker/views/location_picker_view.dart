import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/button.dart';
import '../../../global_widgets/googleMap.dart';
import '../../../services/location.dart';
import '../controllers/location_picker_controller.dart';

// ignore: import_of_legacy_library_into_null_safe
// import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';

class LocationPickerView extends GetView<LocationPickerController> {
  final controller = Get.find<LocationPickerController>();
  final location = Get.find<GoogleLocation>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Obx(
              () => ETGoogleMap(
                onMapCreated: controller.createMap,
                myLocationEnabled: true,
                onTap: controller.goToPlace,
                markedCoordinates: controller.markedLocation.value,
              ),
            ),
            // FormInputField(
            //   label: 'Search Places',
            //   readOnly: true,
            //   suffixIcon: Icons.search_rounded,
            // ).changeToButton(
            //   onPressed: () => Get.to(() =>) _search()),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ETElevatedButton(
                childText: 'Done',
                size: Size(Get.width * 0.40, 50),
                onPressed: () {
                  print(controller.selectedCoordinates);
                  Get.back(result: controller.selectedCoordinates);
                },
              ),
            ).paddingOnly(bottom: 20)
          ],
        ),
      ),
    );
  }

  // Widget _search() {
  //   return Scaffold(
  //     floatingActionButton: FloatingActionButton(
  //       child: Icon(Icons.arrow_back_ios),
  //       onPressed: Get.back,
  //     ),
  //     body: SafeArea(
  //       bottom: false,
  //       child: MapBoxPlaceSearchWidget(
  //         popOnSelect: true,
  //         apiKey: dotenv.env['MAPBOX_API_KEY'],
  //         searchHint: 'Search around',
  //         onSelected: (place) async {
  //           await controller.goToPlace(
  //             LatLng(
  //               place.geometry.coordinates[1],
  //               place.geometry.coordinates[0],
  //             ),
  //           );
  //         },
  //         context: Get.context,
  //       ),
  //     ),
  //   );
  // }
}
