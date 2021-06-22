import 'package:get/get.dart';

import 'package:eventrack_app/app/modules/edit_User_Profile/bindings/edit_user_profile_binding.dart';
import 'package:eventrack_app/app/modules/edit_User_Profile/views/edit_user_profile_view.dart';
import 'package:eventrack_app/app/modules/event_detail/bindings/event_detail_binding.dart';
import 'package:eventrack_app/app/modules/event_detail/views/event_detail_view.dart';
import 'package:eventrack_app/app/modules/participants_list/bindings/participants_list_binding.dart';
import 'package:eventrack_app/app/modules/participants_list/views/participants_list_view.dart';
import 'package:eventrack_app/app/modules/user_profile/bindings/user_profile_binding.dart';
import 'package:eventrack_app/app/modules/user_profile/views/user_profile_view.dart';

import '../modules/browse_events/bindings/browse_events_binding.dart';
import '../modules/browse_events/views/browse_events_view.dart';
import '../modules/create_event/bindings/create_event_binding.dart';
import '../modules/create_event/views/create_event_view.dart';
import '../modules/event_detail/bindings/event_detail_binding.dart';
import '../modules/event_detail/views/event_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/locationPicker/bindings/location_picker_binding.dart';
import '../modules/locationPicker/views/location_picker_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PARTICIPANTS_LIST;

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
      page: () => SignupView(),
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
      name: _Paths.CREATE_EVENT,
      page: () => CreateEventView(),
      binding: CreateEventBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION_PICKER,
      page: () => LocationPickerView(),
      binding: LocationPickerBinding(),
     ),
     GetPage(
      name: _Paths.USER_PROFILE,
      page: () => UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_USER_PROFILE,
      page: () => EditUserProfileView(),
      binding: EditUserProfileBinding(),
    ),
    GetPage(
      name: _Paths.PARTICIPANTS_LIST,
      page: () => ParticipantsListView(),
      binding: ParticipantsListBinding(),
    ),
  ];
}
