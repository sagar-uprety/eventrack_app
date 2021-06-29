import 'package:flutter/material.dart';

import 'package:dart_date/dart_date.dart';

import './pickers/datetimepicker.dart';
import 'models/event/event.dart';
import 'models/organization/organization.dart';
import 'models/user/user.dart';

// TODO: Remove this file.

class TempData {
  static List<Event> get events => _events;
  static Event get event => _events[0];
  static List<User> get users => _users;
  static User get user => _users[0];

  static List<User> _users = [
    User(
      id: '000001',
      profileImage:
          "https://oesexportimport.com/wp-content/uploads/2020/07/user1.jpg",
      name: "Rose Watson",
      email: "rosewatson@example.com",
      phone: "+977 9863556656",
      address: "New York",
      gender: "Female",
      isVerified: true,
      blockStatus: BlockStatus(isBlocked: false),
    ),
    User(
      id: '000002',
      profileImage:
          "https://platforms.tqnee.com/ta3ref/wp-content/uploads/2019/05/74sByqd.jpg",
      name: "John Peterson",
      email: "johnpeter57@example.com",
      phone: "+977 9867849634",
      address: "Washington Dc",
      isVerified: false,
      blockStatus: BlockStatus(isBlocked: false),
      gender: "Male",
    ),
    User(
        id: '000003',
        profileImage: "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg",
        name: "Brooke White",
        email: "whitebrroke5677@example.com",
        phone: "+977 9867849634",
        address: "London",
        isVerified: true,
        blockStatus: BlockStatus(isBlocked: true),
        gender: "Female"),
    User(
        id: '000004',
        profileImage:
            "https://oesexportimport.com/wp-content/uploads/2020/07/user1.jpg",
        name: "Rose Watson",
        email: "rosewatson@example.com",
        phone: "+977 9863556656",
        isVerified: true,
        blockStatus: BlockStatus(isBlocked: false),
        address: "New York",
        gender: "Female"),
    User(
        id: '000005',
        profileImage:
            "https://platforms.tqnee.com/ta3ref/wp-content/uploads/2019/05/74sByqd.jpg",
        name: "John Peterson",
        email: "johnpeter57@example.com",
        isVerified: true,
        phone: "+977 9867849634",
        blockStatus: BlockStatus(isBlocked: false),
        address: "Washington Dc",
        gender: "Male"),
    User(
        id: '000005',
        profileImage:
            "https://platforms.tqnee.com/ta3ref/wp-content/uploads/2019/05/74sByqd.jpg",
        name: "John Peterson",
        email: "johnpeter57@example.com",
        isVerified: true,
        phone: "+977 9867849634",
        blockStatus: BlockStatus(isBlocked: false),
        address: "Washington Dc",
        gender: "Male"),
    User(
        id: '000005',
        profileImage:
            "https://platforms.tqnee.com/ta3ref/wp-content/uploads/2019/05/74sByqd.jpg",
        name: "John Peterson",
        email: "johnpeter57@example.com",
        isVerified: true,
        phone: "+977 9867849634",
        blockStatus: BlockStatus(isBlocked: false),
        address: "Washington Dc",
        gender: "Male"),
    User(
        id: '000005',
        profileImage:
            "https://platforms.tqnee.com/ta3ref/wp-content/uploads/2019/05/74sByqd.jpg",
        name: "John Peterson",
        email: "johnpeter57@example.com",
        isVerified: true,
        phone: "+977 9867849634",
        blockStatus: BlockStatus(isBlocked: false),
        address: "Washington Dc",
        gender: "Male"),
    User(
        id: '000006',
        profileImage: "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg",
        name: "Brooke White",
        email: "whitebrroke5677@example.com",
        blockStatus: BlockStatus(isBlocked: false),
        isVerified: false,
        phone: "+977 9867849634",
        address: "London",
        gender: "Female"),
  ];

  static List<Event> _events = [
    Event(
      id: '000001',
      title: 'EventTrack',
      description:
          'n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design. \nLorem ipsum is typically a corrupted version of \'De finibus bonorum et malorum\', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.',
      eventProfile:
          'https://media.istockphoto.com/photos/lyttelton-harbour-christchurch-new-zealand-picture-id913331746?k=6&m=913331746&s=612x612&w=0&h=03tyxfXpPejuylwuI9q8o9IhEHCGnONPDFCxb5qsvFU=',
      categories: ['Educational', 'Sports'],
      dateTime: TimeDate(
          dates: [
            (Date.today + Duration(days: 30)).toIso8601String(),
          ],
          times: [
            TimeOfDay(hour: 9, minute: 0),
            TimeOfDay(hour: 18, minute: 0),
          ].formatTime),
      location: Location(
        latitude: 34.2334,
        longitude: 43.4542,
        location: 'New York, USA',
      ),
    ),
    Event(
      id: '000002',
      title: 'EventTrack',
      description:
          'n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design. \nLorem ipsum is typically a corrupted version of \'De finibus bonorum et malorum\', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.',
      eventProfile:
          'https://media.istockphoto.com/photos/lyttelton-harbour-christchurch-new-zealand-picture-id913331746?k=6&m=913331746&s=612x612&w=0&h=03tyxfXpPejuylwuI9q8o9IhEHCGnONPDFCxb5qsvFU=',
      categories: ['Educational', 'Sports'],
      dateTime: TimeDate(
          dates: [
            (Date.today + Duration(days: 30)).toIso8601String(),
          ],
          times: [
            TimeOfDay(hour: 9, minute: 0),
            TimeOfDay(hour: 18, minute: 0),
          ].formatTime),
      location: Location(
        latitude: 34.2334,
        longitude: 43.4542,
        location: 'New York, USA',
      ),
    ),
    Event(
      id: '000003',
      title: 'EventTrack',
      description:
          'n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design. \nLorem ipsum is typically a corrupted version of \'De finibus bonorum et malorum\', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.',
      eventProfile:
          'https://media.istockphoto.com/photos/lyttelton-harbour-christchurch-new-zealand-picture-id913331746?k=6&m=913331746&s=612x612&w=0&h=03tyxfXpPejuylwuI9q8o9IhEHCGnONPDFCxb5qsvFU=',
      categories: ['Educational', 'Sports'],
      dateTime: TimeDate(
          dates: [
            (Date.today + Duration(days: 30)).toIso8601String(),
          ],
          times: [
            TimeOfDay(hour: 9, minute: 0),
            TimeOfDay(hour: 18, minute: 0),
          ].formatTime),
      location: Location(
        latitude: 34.2334,
        longitude: 43.4542,
        location: 'New York, USA',
      ),
    ),
    Event(
      id: '000004',
      title: 'EventTrack',
      description:
          'n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design. \nLorem ipsum is typically a corrupted version of \'De finibus bonorum et malorum\', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.',
      eventProfile:
          'https://media.istockphoto.com/photos/lyttelton-harbour-christchurch-new-zealand-picture-id913331746?k=6&m=913331746&s=612x612&w=0&h=03tyxfXpPejuylwuI9q8o9IhEHCGnONPDFCxb5qsvFU=',
      categories: ['Educational', 'Sports'],
      dateTime: TimeDate(
          dates: [
            (Date.today + Duration(days: 30)).toIso8601String(),
          ],
          times: [
            TimeOfDay(hour: 9, minute: 0),
            TimeOfDay(hour: 18, minute: 0),
          ].formatTime),
      location: Location(
        latitude: 34.2334,
        longitude: 43.4542,
        location: 'New York, USA',
      ),
    ),
  ];
}
