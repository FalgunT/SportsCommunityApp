import 'package:get/get.dart';
import 'WelcomeViewModel.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeViewModel>(
          () => WelcomeViewModel(),
    );
  }
}