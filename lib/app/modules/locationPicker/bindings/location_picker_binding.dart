import 'package:get/get.dart';

import '../../../services/location.dart';
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
