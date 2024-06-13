import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sportcommunityapp/app/data/model/usermodel.dart';
import 'package:sportcommunityapp/app/data/repository/UserRepository.dart';

import '../../core/BaseController.dart';

class ProfileViewModel extends BaseController {
  final UserRepository _repository = Get.find(tag: (UserRepository).toString());

  var user = UsersModel.empty().obs;
  var currentIndex = 0.obs;

  Future<void> getUser() async {
    user.value = await _repository.getUserbyId(1);
  }
}
