import 'package:eventrack_app/app/services/location.dart';
import 'package:get/get.dart';

import '../controllers/location_picker_controller.dart';

class LocationPickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationPickerController>(
      () => LocationPickerController(),
    );
    Get.lazyPut<GoogleLocation>(
      () => GoogleLocation(),
    );
  }
}
