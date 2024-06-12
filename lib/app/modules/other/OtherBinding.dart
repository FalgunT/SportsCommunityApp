import 'package:get/get.dart';
import 'OtherViewModel.dart';

class OtherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherViewModel>(
      () => OtherViewModel(),
    );
  }
}
