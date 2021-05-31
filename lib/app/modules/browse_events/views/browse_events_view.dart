import 'package:eventrack_app/app/global_widgets/app_drawer.dart';
import 'package:eventrack_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/browse_events_controller.dart';

class BrowseEventsView extends GetView<BrowseEventsController> {
  @override
  Widget build(BuildContext context) {
    final eventController = Get.find<BrowseEventsController>();

    return Scaffold(
        appBar: AppBar(
          title: Text('News App'),
          centerTitle: true,
        ),
        drawer: buildAppDrawer(),
        body: Obx(() {
          if (eventController.isLoading.isTrue) {
            return Center(child: CircularProgressIndicator());
          } else if (eventController.eventList == null) {
            return Center(child: Text("Cound Not Fetch Data"));
          } else {
            return ListView.builder(
              itemCount: eventController.eventList!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${eventController.eventList![index].eventTitle}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Divider(),
                      Text(
                        '${eventController.eventList![index].eventDescription}',
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                      Divider(),
                      ElevatedButton(
                        onPressed: () => Get.toNamed(Routes.EVENT_DETAIL,
                            arguments: eventController.eventList![index]),
                        child: Text("View Details"),
                      )
                    ],
                  ),
                );
              },
            );
          }
        }));
  }
}
