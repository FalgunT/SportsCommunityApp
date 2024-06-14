import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sportcommunityapp/app/data/model/eventmodel.dart';
import 'package:sportcommunityapp/app/data/model/friendmodel.dart';
import 'package:sportcommunityapp/app/data/model/usermodel.dart';
import 'package:sportcommunityapp/app/data/repository/EventRepository.dart';
import 'package:sportcommunityapp/app/data/repository/FriendRepository.dart';
import 'package:sportcommunityapp/app/data/repository/UserRepository.dart';
import 'package:sportcommunityapp/util/Session.dart';

import '../../core/BaseController.dart';

class HomeViewModel extends BaseController {
  final FriendRepository _repository =
      Get.find(tag: (FriendRepository).toString());
  final UserRepository _urepository =
      Get.find(tag: (UserRepository).toString());
  final EventRepository _erepository =
      Get.find(tag: (EventRepository).toString());

  RxList<FriendModel> pendingfriends = RxList.empty();
  RxList<UsersModel> pendingUfriends = RxList.empty();
  RxList<EventModel> upcomingEvents = RxList.empty();

  var currentIndex = 0.obs;
  TextEditingController textsearchController = TextEditingController();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPendingList();
    getUpcomingEvent();
  }

  Future<void> getPendingList() async {
    pendingfriends.value =
        await _repository.getPendingFriends(Session.obj.user.id);
    pendingUfriends.value = [];
    for (int i = 0; i < pendingfriends.value.length; i++) {
      UsersModel model =
          await _urepository.getUserbyId(pendingfriends.value[i].UserID);
      pendingUfriends.value.add(model);
    }
  }

  Future<void> savePendingFriends(int pos, int val) async {
    pendingfriends.value[pos].isAccepted = val;
    await _repository.update(pendingfriends.value[pos]);
    getPendingList();
  }

  getUpcomingEvent() async {
    upcomingEvents.value = await _erepository.getAllEvent();
  }
}
