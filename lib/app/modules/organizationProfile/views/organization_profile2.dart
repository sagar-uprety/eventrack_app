import 'package:eventrack_app/app/modules/organizationProfile/views/tabs/tab1.dart';
import 'package:eventrack_app/app/modules/organizationProfile/views/tabs/tab2.dart';
import 'package:eventrack_app/app/modules/organizationProfile/views/tabs/tab3.dart';
import 'package:eventrack_app/app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrganizationProfile2 extends StatefulWidget {
  const OrganizationProfile2({Key? key}) : super(key: key);

  @override
  _OrganizationProfile2State createState() => _OrganizationProfile2State();
}

class _OrganizationProfile2State extends State<OrganizationProfile2>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: AppColors.background,
      ),
      child: new DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: new Column(
          children: <Widget>[
            new TabBar(
              controller: _tabController,
              indicatorColor: AppColors.dark25,
              indicatorWeight: 3.0,
              labelStyle: Get.textTheme.bodyText1!
                  .copyWith(fontWeight: FontWeight.w600),
              labelPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              isScrollable: true,
              labelColor: AppColors.dark80,
              unselectedLabelColor: AppColors.dark50,
              tabs: <Widget>[
                Tab(text: 'ABOUT'),
                Tab(text: 'TAB2'),
                Tab(text: 'TAB3'),
              ],
            ),
            // new TabBarView(
            //   controller: _tabController,
            //   children: <Widget>[
            //     OrganizationProfileTab1(),
            //     OrganizationProfileTab2(),
            //     OrganizationProfileTab3(),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
