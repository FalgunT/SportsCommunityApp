import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../util/Session.dart';
import '../../core/BaseController.dart';
import '../../data/repository/UserRepository.dart';
import 'IntroPage.dart';

class WelcomeViewModel extends BaseController {
  final PageController pageController = PageController(initialPage: 0);
  var activePage = 0.obs;
  final List<Widget> pages = [
    IntroPage("assets/images/img1.avif", "Welcome to SportsConnect",
        "Join the ultimate sports community! Connect with athletes, fans, and local events to fuel your passion for sports."),
    IntroPage("assets/images/img2.jpg", "Find Local Events",
        "Discover and join local sports events. Stay active and connect with like-minded sports enthusiasts near you."),
    IntroPage("assets/images/img4.jpeg", "Connect and Share",
        "Engage with friends and fellow athletes. Share your journey, celebrate milestones, and inspire others in the sports community."),
  ];
}
