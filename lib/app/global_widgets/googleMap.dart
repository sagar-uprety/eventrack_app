import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../services/location.dart';

///Create a `Widget` of `GoogleMap`.
///
///Enclose this widget with a `SizedBox` for a fixed size.
class ETGoogleMap extends GetView<GoogleLocation> {
  const ETGoogleMap(
      {Key? key,
      required this.onMapCreated,
      this.myLocationEnabled = true,
      this.markedCoordinates,
      this.onTap})
      : super(key: key);

  ///Function to set the `GoogleMapController.
  final void Function(GoogleMapController) onMapCreated;

  ///The coordinates of a `Marker` to display (if any)
  final LatLng? markedCoordinates;

  ///If `true`, shows your `Location` and also a button to change the `CameraPosition` to your `Location`.
  final bool myLocationEnabled;

  ///The action to perform on tapping with in the map.
  ///
  ///If `null`, no actions are performed.
  final Function(LatLng)? onTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GoogleLocation>(
      init: GoogleLocation(),
      builder: (location) => location.currentLocation == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              mapType: MapType.normal,
              onMapCreated: onMapCreated,
              compassEnabled: true,
              myLocationEnabled: myLocationEnabled,
              myLocationButtonEnabled: myLocationEnabled,
              markers: !(markedCoordinates == LatLng(0, 0))
                  ? {
                      Marker(
                        markerId: MarkerId('marker'),
                        alpha: 0.7,
                        position: markedCoordinates!,
                      ),
                    }
                  : {},
              initialCameraPosition: CameraPosition(
                target: markedCoordinates == LatLng(0, 0)
                    ? LatLng(
                        location.currentLocation!.latitude,
                        location.currentLocation!.longitude,
                      )
                    : markedCoordinates!,
                zoom: 15,
              ),
              onTap: onTap,
            ),
    );
  }
}
