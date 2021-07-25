import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../routes/app_pages.dart';

Drawer buildAppDrawer({bool? createdOrg}) {
  return Drawer(
    child: ListView(
      children: [
        Container(
          child: DrawerHeader(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.check,
                      size: 60,
                    ),
                    radius: 50,
                    backgroundColor: Colors.blueGrey,
                  ),
                  Text(
                    'EventTrack',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ListTile(
          title: Text("Home"),
          onTap: () => Get.toNamed(Routes.HOME),
          leading: Icon(Icons.home),
        ),
        ListTile(
          title: Text("Search Events"),
          onTap: () => Get.toNamed(Routes.EVENT_LIST),
          leading: Icon(Icons.search),
        ),
        ListTile(
          title: Text("Registered Events"),
          onTap: () => Get.toNamed(Routes.EVENT_LIST),
          leading: Icon(Icons.pages_outlined),
        ),
        ListTile(
          title: Text("Favourite Events"),
          onTap: () => Get.toNamed(Routes.EVENT_LIST),
          leading: Icon(Icons.favorite_border),
        ),
        Divider(
          color: Colors.black,
        ),
        ListTile(
          title: Text("Profile"),
          onTap: () => Get.toNamed(Routes.USER_PROFILE),
          leading: Icon(Icons.person),
        ),
        (createdOrg == null) ? Center() :
        !createdOrg
            ? ListTile(
                title: Text("Create Organization"),
                onTap: () => Get.toNamed(Routes.CREATE_ORGANIZATION),
                leading: Icon(Icons.create_rounded),
              )
            : ListTile(
                title: Text("Your Organization"),
                onTap: () => Get.toNamed(Routes.ORGANIZATION_PROFILE),
                leading: Icon(Icons.business),
              ),
        Divider(
          color: Colors.black,
        ),
        ListTile(
          title: Text("Logout"),
          onTap: () => Get.toNamed(Routes.LOGIN),
          leading: Icon(Icons.logout),
        )
      ],
    ),
  );
}
