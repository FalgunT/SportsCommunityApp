import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sportcommunityapp/app/data/model/usermodel.dart';
import 'package:sportcommunityapp/app/data/repository/UserRepository.dart';

import '../../core/BaseController.dart';

class OtherViewModel extends BaseController {
  final UserRepository _repository = Get.find(tag: (UserRepository).toString());

  RxList<UsersModel> schools = RxList.empty();
  var currentIndex = 0.obs;
  Future<void> getSchoolList() async {
    schools.value = await _repository.getUser();
  }

}
