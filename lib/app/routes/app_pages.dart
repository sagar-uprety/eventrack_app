import 'package:eventrack_app/app/modules/event_detail/views/event_detail_view.dart';
import 'package:get/get.dart';

import 'package:eventrack_app/app/modules/event_detail/bindings/event_detail_binding.dart';
import 'package:eventrack_app/app/modules/home/bindings/home_binding.dart';
import 'package:eventrack_app/app/modules/userdashboard/bindings/userdashboard_binding.dart';
import 'package:eventrack_app/app/modules/userdashboard/views/userdashboard_view.dart';

import '../modules/browse_events/bindings/browse_events_binding.dart';
import '../modules/browse_events/views/browse_events_view.dart';
import '../modules/home/views/home.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.USERDASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignUpView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.BROWSE_EVENTS,
      page: () => BrowseEventsView(),
      binding: BrowseEventsBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_DETAIL,
      page: () => EventDetailView(),
      binding: EventDetailBinding(),
    ),
    GetPage(
      name: _Paths.USERDASHBOARD,
      page: () => UserdashboardView(),
      binding: UserdashboardBinding(),
    ),
  ];
}
