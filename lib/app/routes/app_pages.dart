import 'package:get/get.dart';

import '../modules/browse_events/bindings/browse_events_binding.dart';
import '../modules/browse_events/views/browse_events_view.dart';
import '../modules/create_event/bindings/create_event_binding.dart';
import '../modules/create_event/views/create_event_view.dart';
<<<<<<< Updated upstream
=======
import '../modules/create_organization/bindings/create_organization_binding.dart';
import '../modules/create_organization/views/create_organization_view.dart';
import '../modules/edit_User_Profile/bindings/edit_user_profile_binding.dart';
import '../modules/edit_User_Profile/views/edit_user_profile_view.dart';
import '../modules/eventList/bindings/event_list_binding.dart';
import '../modules/eventList/views/event_list_view.dart';
>>>>>>> Stashed changes
import '../modules/event_detail/bindings/event_detail_binding.dart';
import '../modules/event_detail/views/event_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/locationPicker/bindings/location_picker_binding.dart';
import '../modules/locationPicker/views/location_picker_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/organizationProfile/bindings/organization_profile_binding.dart';
import '../modules/organizationProfile/views/organization_profile_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

<<<<<<< Updated upstream
  static const INITIAL = Routes.ORGANIZATION_PROFILE;
=======
  static const INITIAL = Routes.CREATE_ORGANIZATION;
>>>>>>> Stashed changes

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
      name: _Paths.ORGANIZATION_PROFILE,
      page: () => OrganizationProfileView(),
      binding: OrganizationProfileBinding(),
    ),
<<<<<<< Updated upstream
=======
    GetPage(
      name: _Paths.PASSWORD_RESET,
      page: () => PasswordResetView(),
      binding: PasswordResetBinding(),
    ),
    GetPage(
      name: _Paths.TOKEN_VERIFCATION,
      page: () => TokenVerifcationView(),
      binding: TokenVerifcationBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_LIST,
      page: () => EventListView(),
      binding: EventListBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_ORGANIZATION,
      page: () => CreateOrganizationView(),
      binding: CreateOrganizationBinding(),
    ),
>>>>>>> Stashed changes
  ];
}
