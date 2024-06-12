import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sportcommunityapp/app/data/model/usermodel.dart';
import 'package:sportcommunityapp/app/data/repository/UserRepository.dart';

import '../../core/BaseController.dart';
import '../home/HomeView.dart';
import '../inbox/InboxView.dart';
import '../other/OtherView.dart';
import '../profile/ProfileView.dart';

class MainViewModel extends BaseController {
  //final UserRepository _repository = Get.find(tag: (UserRepository).toString());
  var currentIndex = 0.obs;
  final widgetOptions = <Widget>[
    HomeView(),
    OtherView(),
    InboxView(),
    ProfileView(),
  ];
}
