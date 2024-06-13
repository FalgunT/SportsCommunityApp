import 'package:get/get.dart';
import 'package:sportcommunityapp/app/modules/event/EventViewModel.dart';


class EventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventViewModel>(
          () => EventViewModel(),
    );
  }
}