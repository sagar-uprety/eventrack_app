import 'package:get/get.dart';

import '../Models/Event_listmodel.dart';

class EventListController extends GetxController {
  get events => _eventsmodel;
  static List<EventsModel> _eventsmodel = [
    EventsModel(
      date: "2021-06-13",
      name: "Red Mountains",
      image: "assets/images/Red_Mountains.png",
      time: "5:01PM",
    ),
    EventsModel(
      date: "2021-06-13",
      name: "Red Mountains",
      image: "assets/images/Red_Mountains.png",
      time: "5:01PM",
    ),
    EventsModel(
      date: "2021-06-13",
      name: "Red Mountains",
      image: "assets/images/Red_Mountains.png",
      time: "5:01PM",
    ),
  ];
  final count = 0.obs;
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
  void increment() => count.value++;
}
