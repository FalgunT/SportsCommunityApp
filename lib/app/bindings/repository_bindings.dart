import 'package:get/get.dart';
import 'package:sportcommunityapp/app/data/repository/UserRepository.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(
      () => UserRepository(),
      tag: (UserRepository).toString(),
    );
  }
}
