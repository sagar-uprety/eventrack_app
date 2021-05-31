import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/routes/app_pages.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    GetMaterialApp(
      title: "Eventrack",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
