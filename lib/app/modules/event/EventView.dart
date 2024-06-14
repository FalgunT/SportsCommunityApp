import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sportcommunityapp/app/data/model/eventmodel.dart';
import 'package:sportcommunityapp/app/modules/event/EventViewModel.dart';
import 'package:sportcommunityapp/app/routes/app_pages.dart';
import 'package:sportcommunityapp/app/theme/ProjectTheme.dart';
import 'package:sportcommunityapp/util/custom_textfield.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import '../../../util/Session.dart';
import '../../core/BaseView.dart';

class Eventview extends BaseView<EventViewModel> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black54,
      leading: Image.asset(
        'assets/icons/ic_launcher.png',
        height: 72,
        width: 72,
      ),
      title: Column(
        children: [
          RichText(
            text: TextSpan(
              text: 'Hi, ',
              style: Theme.of(context).textTheme.titleLarge,
              children: <TextSpan>[
                TextSpan(
                    text: Session.obj.user.Name,
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // TextEditingController eventName = TextEditingController();
  // TextEditingController eventDesc = TextEditingController();
  // TextEditingController eventAddress = TextEditingController();

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Event Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
                controller: controller.eventName.value, hintText: "Event Name"),
            const SizedBox(
              height: 15,
            ),
            const Text("Event Description",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
                controller: controller.eventDesc.value,
                hintText: "Event Description"),
            const SizedBox(
              height: 15,
            ),
            const Text("Event Address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
                controller: controller.eventAddress.value,
                hintText: "Event Address"),
            const SizedBox(
              height: 15,
            ),
            const Text("Event Date",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 8,
            ),
            // CustomTextField(
            //     controller: controller.eventAddress.value,
            //     hintText: "Event Address"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                controller.eventDate.value == null
                    ? Text("Select Date")
                    : Text(
                        "${DateFormat('yyyy MMMM dd :').add_jm().format(controller.eventDate.value!)}"),
                InkWell(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2018, 3, 5),
                          maxTime: DateTime(2019, 6, 7),
                          theme: picker.DatePickerTheme(
                              cancelStyle:
                                  TextStyle(color: Colors.grey.shade500),
                              headerColor: ProjectTheme.onBackground,
                              backgroundColor: ProjectTheme.onBackground,
                              itemStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              doneStyle:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          onChanged: (date) {
                        print('change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString());
                      }, onConfirm: (date) {
                        print('confirm $date');

                        controller.eventDate.value = date;
                      },
                          currentTime: DateTime.now(),
                          locale: picker.LocaleType.en);
                    },
                    child: Icon(Icons.calendar_month))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  var currentdateTime = DateTime.now().millisecondsSinceEpoch;
                  var eventDateTime =
                      controller.eventDate.value!.millisecondsSinceEpoch;

                  EventModel eventData = EventModel(
                    id: null,
                    EventName: controller.eventName.value.text,
                    EventAddress: controller.eventAddress.value.text,
                    EventDesc: controller.eventDesc.value.text,
                    EventTime: eventDateTime.toInt(),
                    CreatedBy: Session.obj.user.id,
                    CreatedDate: currentdateTime.toInt(),
                  );
                  await controller.addEvent(eventData).then((onValue) {
                    onValue == true
                        ? Get.offAndToNamed(Routes.MAIN)
                        : showErrorSnackBar("Something went wrong");
                  });
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      color: ProjectTheme.primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    "Add Event",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
