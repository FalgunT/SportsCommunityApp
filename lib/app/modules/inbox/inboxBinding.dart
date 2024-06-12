import 'package:get/get.dart';
import 'InboxViewModel.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InboxViewModel>(
      () => InboxViewModel(),
    );
  }
}
