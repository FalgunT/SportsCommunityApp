import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:sportcommunityapp/app/core/BaseController.dart';
import 'package:sportcommunityapp/app/data/repository/EventRepository.dart';

class EventViewModel extends BaseController {
  final EventRepository _repository =
      Get.find(tag: (EventRepository).toString());

  RxList event = [].obs;
  var currentIndex = 0.obs;

  Future<void> getAllEventByUserId() async {
    event.value = (await _repository.getAllEventByUserId(1));
  }
}
