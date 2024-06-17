import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sportcommunityapp/app/data/model/eventmodel.dart';
import 'package:sportcommunityapp/app/data/model/usermodel.dart';
import 'package:sportcommunityapp/app/theme/ProjectTheme.dart';
import 'package:sportcommunityapp/util/AppStrings.dart';

import '../../core/BaseView.dart';
import '../../routes/app_pages.dart';
import 'HomeViewModel.dart';

class HomeView extends BaseView<HomeViewModel> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: ProjectTheme.getBoxDecoration(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card.filled(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    elevation: 4,
                    color: ProjectTheme.primaryAccentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        height: 48,
                        width: double.maxFinite,
                        child: TextField(
                          onChanged: _handleSearch,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            border: OutlineInputBorder(
                              //borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Search for Items",
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),

                  /*  SearchBar(
                    //padding: EdgeInsetsGeometry.lerp(a, b, t)
                    leading: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.search_rounded),
                    ),
                    hintText: 'Search events',
                    onTap: () {
                      //Go to the next screen
                    },
                  ),*/
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() => controller.pendingfriends.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                          child: Text(
                            pendinginvite,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )
                      : Center()),
                  Obx(() => controller.pendingfriends.isEmpty
                      ? Center()
                      : CarouselSlider(
                          options: CarouselOptions(height: 80.0),
                          items: getpendingWidget(),
                        )),
                  Obx(() => controller.upcomingEvents.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                          child: Text(
                            upcomingevent,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )
                      : Center()),
                  Obx(
                    () => controller.upcomingEvents.isNotEmpty
                        ? CarouselSlider(
                            options: CarouselOptions(height: 360.0),
                            items: getEventView(),
                          )
                        : Center(),
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: ProjectTheme.primaryColor,
            label: Text(
              "Add Event",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            icon: const Icon(
              Icons.add,
            ),
            elevation: 10,
            isExtended: true,
            onPressed: () {
              Get.toNamed(Routes.EVENT)?.then((_) {
                controller.getPendingList();
                controller.getUpcomingEvent();
              });
            }));
  }

  List<Widget> getpendingWidget() {
    List<Widget> widgets = [];
    for (int i = 0; i < controller.pendingUfriends.length; i++) {
      UsersModel model = controller.pendingUfriends[i];
      widgets.add(Builder(
        builder: (BuildContext context) {
          return Card.filled(
            color: ProjectTheme.primaryAccentColor,
            elevation: 4,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getUserImage(i, model),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' ${model.Name}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          ' ${model.Age} years old ' /* \u2B24  ${model.Gender}*/,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.cancel_rounded,
                    size: 36,
                  ),
                  onPressed: () {
                    controller.savePendingFriends(i, 0);
                  },
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.check_circle_rounded,
                    size: 36,
                  ),
                  onPressed: () {
                    controller.savePendingFriends(i, 1);
                  },
                ),
              ],
            ),
          );
        },
      ));
    }

    return widgets;
  }

  getUserImage(int i, UsersModel model) {
    if (model.Gender == "M") {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'assets/images/boy${(i % 3) + 1}.jpg',
          height: 72,
          width: 72,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'assets/images/girl${(i % 3) + 1}.jpg',
          height: 72,
          width: 72,
        ),
      );
    }
  }

  List<Widget> getEventView() {
    List<Widget> widgets = [];
    for (int i = 0; i < controller.upcomingEvents.length; i++) {
      EventModel model = controller.upcomingEvents[i];
      widgets.add(Builder(
        builder: (BuildContext context) {
          return Card.filled(
            color: ProjectTheme.primaryAccentColor,
            elevation: 4,
            child: Stack(

                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/event${(i % 3) + 1}.jpg',
                      height: 352,
                      width: 352,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 80,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: 200,
                        width: 100,
                        // color: Colors.black54,
                        color: Color(0xAF000000),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 12,
                                ),
                                Text(
                                  '${DateFormat(' MMM dd : ').add_jm().format(DateTime.fromMillisecondsSinceEpoch(model.EventTime))}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            Text(
                              '${model.EventName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    '${model.EventAddress}',
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ))
                ]),
          );
        },
      ));
    }
    return widgets;
  }

  void _handleSearch(String value) {}
}
