import 'package:eventrack_app/app/modules/userdashboard/views/widgets/horizontal_place_item.dart';
import 'package:eventrack_app/app/modules/userdashboard/views/widgets/icon_badge.dart';
import './widgets/icon_badge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './util/places.dart';
import './components/overview_detail.dart';
import '../controllers/userdashboard_controller.dart';
import 'components/vertical_place_item.dart';

class UserdashboardView extends GetView<UserdashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white12,
        leading: Icon(
          Icons.arrow_back,
          size: 25,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
                icon: Icons.notifications_none,
                color: Colors.black12,
                size: 20),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5.0, left: 15.0),
            child: Text(
              "Hello Nista",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 17.0, top: 20.0, right: 20.0, bottom: 20.0),
            child: Container(
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey[300],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/4.jpeg'),
                      radius: 42,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 120.0, top: 12),
                    child: OverviewDetail(
                      info: 'Nista Simkhada',
                      eventsattended: 'attended events: 2',
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildHorizontalList(context),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Text(
              "My Events",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
          buildVerticalList(),
        ],
      ),
    );
  }

  buildHorizontalList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 274.0,
      width: 300,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = places.reversed.toList()[index];
          return HorizontalPlaceItem(place: place);
        },
      ),
    );
  }
}

buildVerticalList() {
  return Padding(
    padding: EdgeInsets.all(20.0),
    child: ListView.builder(
      primary: false,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      // ignore: unnecessary_null_comparison
      itemCount: places == null ? 0 : places.length,
      itemBuilder: (BuildContext context, int index) {
        Map place = places[index];
        return VerticalPlaceItem(place: place);
      },
    ),
  );
}
