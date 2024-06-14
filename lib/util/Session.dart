import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app/data/model/usermodel.dart';
import '../app/data/repository/UserRepository.dart';

class Session {
  static final Session obj = Session._internal();

  factory Session() {
    return obj;
  }

  var user = UsersModel.empty();

  Session._internal();

  Future<void> getUser() async {
    final UserRepository _repository =
    Get.find(tag: (UserRepository).toString());
    Session session = Session();
    session.user = await _repository.getUserbyId(1);
    debugPrint('User--->${session.user.Name}');
  }
}
