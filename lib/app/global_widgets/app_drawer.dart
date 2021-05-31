import '../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Drawer buildAppDrawer() {
  return Drawer(
    child: ListView(
      children: [
        ListTile(
          title: Text("Home"),
          onTap: () => Get.toNamed(Routes.HOME),
          leading: Icon(Icons.pages_outlined),
        ),
        ListTile(
          title: Text("Latest Events"),
          onTap: () => Get.toNamed(Routes.BROWSE_EVENTS),
          leading: Icon(Icons.pages_outlined),
        ),
        ListTile(
          title: Text("Search Events"),
          // onTap: () => Get.toNamed(Routes.SEARCH_NEWS),
          leading: Icon(Icons.search),
        )
      ],
    ),
  );
}
