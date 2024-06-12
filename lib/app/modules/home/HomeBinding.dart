import 'package:get/get.dart';
import 'HomeViewModel.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewModel>(
          () => HomeViewModel(),
    );
  }
}