import 'package:eventrack_app/app/pickers/datetimepicker.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/formField.dart';
import '../../../global_widgets/tiles/eventCard.dart';
import '../controllers/event_list_controller.dart';

List<String> categoriesList = [
    'Award',
    'Competition',
    'Educational',
    'Festival',
    'Networking',
    'Science & Technology',
    'Seminar',
    'Social',
    'Sports',
    'Trade',
    'Workshop',
    'Others'
  ];

  List<Color> colors = [
    Colors.red[200]!,
    Colors.green[200]!,
    Colors.blue[200]!,
    Colors.brown[200]!,
    Colors.purple[200]!,
    Colors.lightGreen[400]!,
    Colors.lightBlueAccent[200]!,
    Colors.orange[200]!,
    Colors.red[300]!,
    Colors.blue[300]!,
    Colors.brown[300]!,
    Colors.blueGrey[200]!,
  ];

class EventListView extends GetView<EventListController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: ETAppBar(
          title: 'Explore Events',
          addBackButton: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: controller.searchFormKey,
                child: Column(
                  children: [
                    FormInputField(
                      label: 'Search',
                      controller: controller.searchText,
                      suffixIcon: Icons.search,
                      onClickedSuffix: controller.search,
                    ),
                    
                    ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToExpand: true,
                    tapBodyToCollapse: true,
                    hasIcon: false,
                  ),
                  header: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Filter",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                    ),
                              ),
                              Icon(
                                Icons.filter_alt,
                              ),
                            ],
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                  collapsed: Container(
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Catergories',
                                style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              itemCount: categoriesList.length,
                              itemBuilder: (_, i) => MaterialButton(
                                color: colors[i],
                                child: Text(
                                  categoriesList[i],
                                ),
                                onPressed: ()=>{
                                  print("HI"),
                                },
                              ).paddingOnly(right: 10, bottom: 5),
                            ),
                          ).paddingSymmetric(vertical: 10),
                        ],
                      ),
                      SizedBox(
                        height: 10
                      ),
                      Row(
                        children: [
                          Icon(Icons.filter_list),
                          Text(
                            'Sort by Date',
                            style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                          ),
                          SizedBox(
                            height: 25,
                            child: MaterialButton(
                              child: Text(
                              'Select Date',
                              style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: Colors.blue[800],
                                      ),
                            ),
                            onPressed: ()=>{
                             DateTimePicker.dateRangePicker(context)
                            },
                            ),
                          )
                        ],
                      ),
                    ],
                  ).paddingSymmetric(vertical: 10),
                ).paddingSymmetric(vertical: 10, horizontal: 20),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.events.length,
                itemBuilder: (_, index) {
                  return EventCard(controller.events[index]);
                },
              ).paddingOnly(top: 10, bottom: 15),
              
            ],
          ),
        ),
      ),
    );
  }
}
