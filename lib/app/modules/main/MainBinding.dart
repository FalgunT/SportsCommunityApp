import 'package:get/get.dart';
import 'package:sportcommunityapp/app/modules/home/HomeViewModel.dart';
import 'package:sportcommunityapp/app/modules/inbox/InboxViewModel.dart';
import 'package:sportcommunityapp/app/modules/other/OtherViewModel.dart';
import '../event/EventViewModel.dart';
import '../profile/ProfileViewModel.dart';
import 'MainViewModel.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainViewModel>(
          () => MainViewModel(),
    );
    Get.lazyPut<HomeViewModel>(
          () => HomeViewModel(),
    );
    Get.lazyPut<OtherViewModel>(
          () => OtherViewModel(),
    );
    Get.lazyPut<EventViewModel>(
          () => EventViewModel(),
    );
    Get.lazyPut<InboxViewModel>(
          () => InboxViewModel(),
    );

    Get.lazyPut<ProfileViewModel>(
          () => ProfileViewModel(),
    );
  }
}