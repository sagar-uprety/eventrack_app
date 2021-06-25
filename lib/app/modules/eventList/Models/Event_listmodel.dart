class EventsModel {
  final String? title;
  final String? description;
  final String? eventCover;
  final List<String>? categories;
  final List<String>? dates;
  final List<String>? times;
  final LocationModel? location;
  final Author? author;
  EventsModel({
    this.title,
    this.description,
    this.eventCover,
    this.categories,
    this.dates,
    this.times,
    this.location,
    this.author,
  });
}

class LocationModel {
  final double latitude;
  final double longitude;
  final String location;

  LocationModel(
      {required this.latitude,
      required this.longitude,
      required this.location});
}

class Author {
  final String profile;
  final String name;

  Author({required this.profile, required this.name});
}
