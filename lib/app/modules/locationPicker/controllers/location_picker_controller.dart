import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPickerController extends GetxController {
  late GoogleMapController? mapController;

  late Rx<Marker> marker = Marker(markerId: MarkerId('marker')).obs;
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
    Marker newMarker = Marker(
      markerId: MarkerId('marker'),
      alpha: 0.7,
      position: coordinates,
    );
    marker.value = newMarker;
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
