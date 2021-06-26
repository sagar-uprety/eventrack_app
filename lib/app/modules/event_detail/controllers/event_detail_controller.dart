import 'package:flutter/material.dart';

import 'package:dart_date/dart_date.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../pickers/datetimepicker.dart';
import '../../eventList/models/Event_listmodel.dart';

class EventDetailController extends GetxController {
  final RxBool showMore = false.obs;
  late GoogleMapController? mapController;

  final EventsModel event = EventsModel(
    title: 'Publishing and Graphic Design',
    description:
        'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design. \nLorem ipsum is typically a corrupted version of \'De finibus bonorum et malorum\', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.',
    // eventCover:
    // 'https://media.istockphoto.com/photos/lyttelton-harbour-christchurch-new-zealand-picture-id913331746?k=6&m=913331746&s=612x612&w=0&h=03tyxfXpPejuylwuI9q8o9IhEHCGnONPDFCxb5qsvFU=',
    categories: ['Educational', 'Sports'],
    dates: [
      (Date.today + Duration(days: 30)).toIso8601String(),
    ],
    times: [
      TimeOfDay(hour: 9, minute: 0),
      TimeOfDay(hour: 18, minute: 0),
    ].formatTime,
    location: LocationModel(
      latitude: 27.6195,
      longitude: 85.5386,
      location: 'New York, USA',
    ),
    author: Author(
      name: 'Jason Mamoa',
      profile:
          'https://www.pinkvilla.com/files/styles/amp_metadata_content_image/public/jason-momoas-family-was-starving-after-his-game-of-thrones-exit.jpg',
    ),
  );

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

  void toggleDescriptionDisplay() => showMore.value = !showMore.value;

  void createMap(GoogleMapController newMapController) {
    mapController = newMapController;
    update();
  }
}
