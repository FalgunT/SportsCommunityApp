import 'package:get/get.dart';
import 'package:sportcommunityapp/app/data/repository/UserRepository.dart';

import '../data/repository/FriendRepository.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(
      () => UserRepository(),
      tag: (UserRepository).toString(),
    );

    Get.lazyPut<FriendRepository>(
          () => FriendRepository(),
      tag: (FriendRepository).toString(),
    );
  }
}
