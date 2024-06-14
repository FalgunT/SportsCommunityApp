import 'package:get/get.dart';
import 'package:sportcommunityapp/app/data/repository/EventRepository.dart';
import 'package:sportcommunityapp/app/data/repository/UserRepository.dart';

import '../../util/Session.dart';
import '../data/repository/FriendRepository.dart';

class RepositoryBindings implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut<UserRepository>(
      () => UserRepository(),
      tag: (UserRepository).toString(),
    );
    Get.lazyPut<FriendRepository>(
      () => FriendRepository(),
      tag: (FriendRepository).toString(),
    );
    Get.lazyPut<EventRepository>(
      () => EventRepository(),
      tag: (EventRepository).toString(),
    );

    await Session.obj.getUser();
  }
}
