import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../Models/Event_listmodel.dart';
import '../controllers/event_list_controller.dart';

class EventListView extends GetView<EventListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Popular Events",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Container(
                      child: ListView.builder(
                          itemCount: controller.events.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return PopularEventTile(
                              controller.events[index],
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopularEventTile extends StatelessWidget {
  final EventsModel event;

  PopularEventTile(this.event);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.EVENT_DETAIL, arguments: event),
      child: Container(
        height: 100,
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            color: Color(0xff29404E), borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width - 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        child: Image.asset(
                          event.image!,
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.name!,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.calendar_today,
                                size: 14.0,
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                event.date!,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.lock_clock,
                                size: 14.0,
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                event.time!,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
