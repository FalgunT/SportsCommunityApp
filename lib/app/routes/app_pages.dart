import 'package:get/get.dart';
import 'package:sportcommunityapp/app/modules/event/EventView.dart';
import 'package:sportcommunityapp/app/modules/main/MainBinding.dart';
import 'package:sportcommunityapp/app/modules/main/MainView.dart';
import 'package:sportcommunityapp/app/modules/welcome/WelcomeBinding.dart';

import '../modules/event/EventBinding.dart';
import '../modules/home/HomeBinding.dart';
import '../modules/home/HomeView.dart';
import '../modules/welcome/WelcomeView.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.OTHER,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EVENT,
      page: () => Eventview(),
      binding: EventBinding(),
    ),
  ];
}
