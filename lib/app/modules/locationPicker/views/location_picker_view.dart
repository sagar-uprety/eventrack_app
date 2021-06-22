import 'package:eventrack_app/app/global_widgets/button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';

import '../../../services/location.dart';
import '../controllers/location_picker_controller.dart';

class LocationPickerView extends GetView<LocationPickerController> {
  final controller = Get.find<LocationPickerController>();
  final location = Get.find<GoogleLocation>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<GoogleLocation>(
          init: GoogleLocation(),
          builder: (location) => location.currentLocation == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Obx(
                  () => Stack(
                    children: [
                      GoogleMap(
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        onMapCreated: controller.createMap,
                        markers: {controller.marker.value},
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                            location.currentLocation!.latitude,
                            location.currentLocation!.longitude,
                          ),
                          zoom: 15,
                        ),
                        onTap: controller.goToPlace,
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
                        child: RoundedRectangularButton(
                          childText: 'Done',
                          size: Size(Get.width * 0.40, 50),
                          onPressed: () {
                            print(controller.selectedCoordinates);
                            Get.back(result: controller.selectedCoordinates);
                            // return pickedLocation;
                          },
                        ),
                      ).paddingOnly(bottom: 20)
                    ],
                  ),
                ),
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
