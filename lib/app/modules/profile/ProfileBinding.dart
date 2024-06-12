import 'package:get/get.dart';
import 'ProfileViewModel.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileViewModel>(
      () => ProfileViewModel(),
    );
  }
}
