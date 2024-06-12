import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/BaseController.dart';
import 'IntroPage.dart';

class WelcomeViewModel extends BaseController {
  final PageController pageController = PageController(initialPage: 0);
  var activePage = 0.obs;
  final List<Widget> pages = [
    IntroPage("assets/images/img1.jpeg", "Welcome to live sports betting app",
        "there will be small description"),
    IntroPage("assets/images/img2.jpeg", "Explore this app",
        "there will be small description"),
    IntroPage("assets/images/img3.jpeg", "Explore this app",
        "there will be small description"),
  ];
}
