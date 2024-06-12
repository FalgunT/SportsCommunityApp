import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sportcommunityapp/app/data/model/friendmodel.dart';
import 'package:sportcommunityapp/app/data/model/usermodel.dart';
import 'package:sportcommunityapp/app/data/repository/FriendRepository.dart';
import 'package:sportcommunityapp/app/data/repository/UserRepository.dart';
import 'package:sportcommunityapp/util/Session.dart';

import '../../core/BaseController.dart';

class HomeViewModel extends BaseController {
  final FriendRepository _repository =
      Get.find(tag: (FriendRepository).toString());

  RxList<FriendModel> pendingfriends = RxList.empty();
  var currentIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPendingList();
  }
  Future<void> getPendingList() async {

    pendingfriends.value = await _repository.getPendingFriends(Session.obj.user.id);
  }
}
