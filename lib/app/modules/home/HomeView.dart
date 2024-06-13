import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(
                //padding: EdgeInsetsGeometry.lerp(a, b, t)
                leading: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.search_rounded),
                ),
                onTap: () {
                  //Go to the next screen
                },
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  pendinginvite,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Obx(() => controller.pendingfriends.value.length <= 0
                  ? CarouselSlider(
                      options: CarouselOptions(height: 100.0),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Card.filled(
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    // margin: EdgeInsets.symmetric(horizontal: 5.0),

                                    child: Text(
                                      'text $i',
                                      style: TextStyle(fontSize: 16.0),
                                    )),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    )
                  : CarouselSlider(
                      options: CarouselOptions(height: 100.0),
                      items: controller.pendingfriends.value.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Card.filled(
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    // margin: EdgeInsets.symmetric(horizontal: 5.0),

                                    child: Text(
                                      ' ${i.UserID}',
                                      style: TextStyle(fontSize: 16.0),
                                    )),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  upcomingevent,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(height: 200.0),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Card.filled(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              // margin: EdgeInsets.symmetric(horizontal: 5.0),

                              child: Text(
                                'text $i',
                                style: TextStyle(fontSize: 16.0),
                              )),
                        ),
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: ProjectTheme.primaryColor,
            label: Text(
              "Add Event",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            elevation: 10,
            isExtended: true,
            // child: Row(
            //   children: [Icon(Icons.add), Text("Add Event")],
            // ),

            onPressed: () {
              //replace eventview here...
              Get.toNamed(Routes.EVENT);
            }));
  }
}
