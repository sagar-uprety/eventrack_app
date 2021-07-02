import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPickerController extends GetxController {
  late GoogleMapController? mapController;

  final markedLocation = Rx<LatLng>(LatLng(0, 0));
  late LatLng? selectedCoordinates;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void createMap(GoogleMapController newMapController) {
    mapController = newMapController;
    update();
  }

  void createMarker(LatLng coordinates) {
    markedLocation.value = coordinates;
  }

  animateCamera(LatLng coordinates) async {
    await mapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: coordinates, zoom: 18),
      ),
    );
  }

  goToPlace(LatLng coordinates) async {
    selectedCoordinates = coordinates;

    createMarker(coordinates);
    animateCamera(coordinates);
  }
}
