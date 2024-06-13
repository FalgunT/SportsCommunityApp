import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:sportcommunityapp/app/core/BaseController.dart';
import 'package:sportcommunityapp/app/data/model/eventmodel.dart';
import 'package:sportcommunityapp/app/data/repository/EventRepository.dart';
import 'package:sportcommunityapp/util/Session.dart';

class EventViewModel extends BaseController {
  final EventRepository _repository =
      Get.find(tag: (EventRepository).toString());

  RxList event = [].obs;
  var currentIndex = 0.obs;

  var eventName = TextEditingController().obs;
  var eventDesc = TextEditingController().obs;
  var eventAddress = TextEditingController().obs;
  var eventDate = Rxn<DateTime>();

  Future<void> getAllEventByUserId() async {
    event.value = (await _repository.getAllEventByUserId(1));
  }

  Future<bool> addEvent(EventModel eventData) async {
    try {
      var result = await _repository.add(eventData);
      return true;
    } catch (e) {
      return false;
    }
  }
}
