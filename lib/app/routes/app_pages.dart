import 'package:get/get.dart';

import 'package:eventrack_app/app/modules/edit_User_Profile/bindings/edit_user_profile_binding.dart';
import 'package:eventrack_app/app/modules/edit_User_Profile/views/edit_user_profile_view.dart';
import 'package:eventrack_app/app/modules/enter_email/bindings/enter_email_binding.dart';
import 'package:eventrack_app/app/modules/enter_email/views/enter_email_view.dart';
import 'package:eventrack_app/app/modules/event_detail/bindings/event_detail_binding.dart';
import 'package:eventrack_app/app/modules/event_detail/views/event_detail_view.dart';
import 'package:eventrack_app/app/modules/password_reset/bindings/password_reset_binding.dart';
import 'package:eventrack_app/app/modules/password_reset/views/password_reset_view.dart';
import 'package:eventrack_app/app/modules/token_verifcation/bindings/token_verifcation_binding.dart';
import 'package:eventrack_app/app/modules/token_verifcation/views/token_verifcation_view.dart';
import 'package:eventrack_app/app/modules/user_profile/bindings/user_profile_binding.dart';
import 'package:eventrack_app/app/modules/user_profile/views/user_profile_view.dart';

import '../modules/browse_events/bindings/browse_events_binding.dart';
import '../modules/browse_events/views/browse_events_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ENTER_EMAIL;

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
      name: _Paths.ENTER_EMAIL,
      page: () => EnterEmailView(),
      binding: EnterEmailBinding(),
    ),
  ];
}
