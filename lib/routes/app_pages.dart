import 'package:untitled3/features/auth/complete_register/complete_register_binding.dart';
import 'package:untitled3/features/auth/complete_register/complete_register_view.dart';
import 'package:untitled3/features/auth/login/login_binding.dart';
import 'package:untitled3/features/auth/login/login_view.dart';
import 'package:untitled3/features/auth/otp/otp_binding.dart';
import 'package:untitled3/features/auth/otp/otp_view.dart';
import 'package:untitled3/features/auth/register/register_binding.dart';
import 'package:untitled3/features/auth/register/register_view.dart';
import 'package:untitled3/features/nav_bar/chat/chat_binding.dart';
import 'package:untitled3/features/nav_bar/competations/competations_binding.dart';
import 'package:untitled3/features/nav_bar/home/follower_profile/follower_profile_binding.dart';
import 'package:untitled3/features/nav_bar/home/follower_profile/follower_profile_view.dart';
import 'package:untitled3/features/nav_bar/home/home_binding.dart';
import 'package:untitled3/features/nav_bar/home/snapchat/snapchat_binding.dart';
import 'package:untitled3/features/nav_bar/home/snapchat/snapchat_view.dart';
import 'package:untitled3/features/nav_bar/home/snapchat/story/story_binding.dart';
import 'package:untitled3/features/nav_bar/home/snapchat/story/story_view.dart';
import 'package:untitled3/features/nav_bar/menu/menu_binding.dart';
import 'package:untitled3/features/nav_bar/navbar.dart';
import 'package:untitled3/features/nav_bar/notifications/notifications_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      bindings: [RegisterBinding()],
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.otp,
      page: () => const OtpPage(),
      bindings: [OtpBinding()],
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.completeRegister,
      page: () => const CompleteRegisterPage(),
      bindings: [CompleteRegisterBinding()],
      transition: Transition.native,
    ),

    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      bindings: [LoginBinding()],
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.navbar,
      page: () => const NavBar(),
      bindings: [
        ChatBinding(),
        CompetationsBinding(),
        HomeBinding(),
        MenuBinding(),
        NotificationsBinding(),
      ],
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.followerProfile,
      page: () => const FollowerProfilePage(),
      bindings: [FollowerProfileBinding()],
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.snapchat,
      page: () => const SnapchatPage(),
      bindings: [SnapchatBinding()],
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.story,
      page: () => StoryPage(),
      bindings: [StoryBinding()],
      transition: Transition.native,
    ),
  ];
}
