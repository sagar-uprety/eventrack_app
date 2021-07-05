import 'package:get/get.dart';

import '../modules/admin_dashboard/bindings/admin_dashboard_binding.dart';
import '../modules/admin_dashboard/views/admin_dashboard_view.dart';
import '../modules/browse_events/bindings/browse_events_binding.dart';
import '../modules/browse_events/views/browse_events_view.dart';
import '../modules/create_event/bindings/create_event_binding.dart';
import '../modules/create_event/views/create_event_view.dart';
import '../modules/create_organization/bindings/create_organization_binding.dart';
import '../modules/create_organization/views/create_organization_view.dart';
import '../modules/edit_User_Profile/bindings/edit_user_profile_binding.dart';
import '../modules/edit_User_Profile/views/edit_user_profile_view.dart';
import '../modules/eventList/bindings/event_list_binding.dart';
import '../modules/eventList/views/event_list_view.dart';
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
import '../modules/participants_list/bindings/participants_list_binding.dart';
import '../modules/participants_list/views/participants_list_view.dart';
import '../modules/password_reset/bindings/password_reset_binding.dart';
import '../modules/password_reset/views/password_reset_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/token_verifcation/bindings/token_verifcation_binding.dart';
import '../modules/token_verifcation/views/token_verifcation_view.dart';
import '../modules/user_list/bindings/user_list_binding.dart';
import '../modules/user_list/views/user_list_view.dart';
import '../modules/user_profile/bindings/user_profile_binding.dart';
import '../modules/user_profile/views/user_profile_view.dart';
import '../modules/userdashboard/bindings/userdashboard_binding.dart';
import '../modules/userdashboard/views/userdashboard_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ADMIN_DASHBOARD;

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
      name: _Paths.BROWSE_EVENTS,
      page: () => BrowseEventsView(),
      binding: BrowseEventsBinding(),
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
      name: _Paths.USER_LIST,
      page: () => UserListView(),
      binding: UserListBinding(),
    ),
    GetPage(
      name: _Paths.PARTICIPANTS_LIST,
      page: () => ParticipantsListView(),
      binding: ParticipantsListBinding(),
    ),
    GetPage(
      name: _Paths.USERDASHBOARD,
      page: () => UserdashboardView(),
      binding: UserdashboardBinding(),
    ),
    GetPage(
      name: _Paths.ORGANIZATION_PROFILE,
      page: () => OrganizationProfileView(),
      binding: OrganizationProfileBinding(),
    ),
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
    GetPage(
      name: _Paths.ADMIN_DASHBOARD,
      page: () => AdminDashboardView(),
      binding: AdminDashboardBinding(),
    ),
  ];
}
