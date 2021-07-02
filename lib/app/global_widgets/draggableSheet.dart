import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../utilities/colors.dart';

///Adds a `DraggableScrollableSheet` to lower 60% and can be dragged upto 85%.
///
///This widget also add a functional `TabBar`.
class DraggableSheet extends StatelessWidget {
  DraggableSheet({Key? key, required this.tabIcons, required this.tabs})
      : assert(tabIcons.length >= 2, "Length of tabs must be at least 2"),
        assert(tabs.length == tabIcons.length,
            "Length of `tabsTitle` and `tabs` must be equal"),
        super(key: key);

  ///`tabIcons` includes list of Icons to display in the `TabBar`
  ///
  ///`tabIcons` length must be `at least 2`
  final List<IconData> tabIcons;

  ///`tabs` includes the information of each tab.
  ///
  ///`tabs` length must be `equal` to `tabIcons`.
  final List<Widget> tabs;

  final _selectedTab = 0.obs;

  void changeTab(int? index) => _selectedTab.value = index!;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.6,
      maxChildSize: 0.85,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              color: AppColors.background,
            ),
            child: new DefaultTabController(
              length: tabs.length,
              initialIndex: 0,
              child: new Column(
                children: <Widget>[
                  new TabBar(
                    indicatorColor: AppColors.dark25,
                    indicatorWeight: 3.0,
                    labelStyle: Get.textTheme.bodyText1!
                        .copyWith(fontWeight: FontWeight.w600),
                    labelPadding:
                        EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                    labelColor: AppColors.dark80,
                    unselectedLabelColor: AppColors.dark50,
                    onTap: changeTab,
                    tabs: <Tab>[
                      for (var i = 0; i < tabs.length; i++)
                        Tab(
                          icon: Icon(
                            tabIcons[i],
                            size: 28,
                          ),
                        ),
                    ],
                  ),
                  Obx(
                    () => tabs[_selectedTab.value],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
