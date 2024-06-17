import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sportcommunityapp/app/data/model/usermodel.dart';
import 'package:sportcommunityapp/app/data/repository/UserRepository.dart';
import 'package:sportcommunityapp/util/Session.dart';
import '../../core/BaseController.dart';
import '../../data/model/friendmodel.dart';
import '../../data/repository/FriendRepository.dart';

class OtherViewModel extends BaseController {
  final FriendRepository _repository =
      Get.find(tag: (FriendRepository).toString());
  final UserRepository _urepository =
      Get.find(tag: (UserRepository).toString());
  RxList<FriendModel> friends = RxList.empty();
  RxList<UsersModel> Ufriends = RxList.empty();
  var currentIndex = 0.obs;

  @override
  void onInit() {
//TODO: implement onInit
    super.onInit();

    //   getList();
  }

  Future<void> getList() async {
    friends.value = await _repository.getFriends();
    Ufriends.value = [];
    for (int i = 0; i < friends.value.length; i++) {
      if (friends.value[i].UserID == Session.obj.user.id) {
        UsersModel model =
            await _urepository.getUserbyId(friends.value[i].FriendUserID);
        Ufriends.value.add(model);
      } else if (friends.value[i].FriendUserID == Session.obj.user.id) {
        UsersModel model =
            await _urepository.getUserbyId(friends.value[i].UserID);
        Ufriends.value.add(model);
      }
    }

    Ufriends.sort(
      (a, b) {
        var aName = a.Name.toLowerCase();
        var bName = b.Name.toLowerCase();
        return aName.compareTo(bName);
      },
    );

    notifyChildrens();
  }

  Future<void> saveFriends(int pos, int val) async {
    friends.value[pos].isAccepted = val;
    await _repository.update(friends.value[pos]);
    getList();
  }
}
