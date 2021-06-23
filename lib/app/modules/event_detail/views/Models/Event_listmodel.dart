class EventsModel {
  final String name, date;
  final String time;
  final String image;

  EventsModel({
    required this.name,
    required this.date,
    required this.time,
    required this.image,
  });
}

List<EventsModel> eventsmodel = [
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
