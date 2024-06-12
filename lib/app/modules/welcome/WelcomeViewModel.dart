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
    IntroPage("assets/images/img1.jpeg", "Welcome to live sports betting app",
        "there will be small description"),
    IntroPage("assets/images/img2.jpeg", "Explore this app",
        "there will be small description"),
    IntroPage("assets/images/img3.jpeg", "Explore this app",
        "there will be small description"),
  ];

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future<void> getUser() async {
    final UserRepository _repository =
        Get.find(tag: (UserRepository).toString());
    Session session = Session();
    session.user = await _repository.getUserbyId(1);
    debugPrint('User--->${session.user.Name}');
  }
}
