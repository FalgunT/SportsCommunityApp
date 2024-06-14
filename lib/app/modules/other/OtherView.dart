import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sportcommunityapp/app/data/model/usermodel.dart';
import '../../core/BaseView.dart';
import '../../theme/ProjectTheme.dart';
import 'OtherViewModel.dart';

//friends
class OtherView extends BaseView<OtherViewModel> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    controller.getList();
    return Scaffold(
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: ProjectTheme.getBoxDecoration(),
          child:Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
                    decoration: InputDecoration(
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

            const SizedBox(
              height: 16,
            ),
            // Center(child: Text("Other")),
            Obx(() => controller.Ufriends.value.length <= 0
                ? Center()
                : Expanded(
                    flex: 1,
                    child: ListView.builder(
                        itemCount: controller.friends.length,
                        itemBuilder: (BuildContext context, int i) {
                          return Container(
                              height: 130,
                              child: Card.filled(
                                color: ProjectTheme.primaryAccentColor,
                                elevation: 4,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          child: getUserImage(
                                              i, controller.Ufriends[i])),
                                      flex: 1,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              ' ${controller.Ufriends[i].Name}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  ' ${controller.Ufriends[i].Age} years old ' /* \u2B24  ${model.Gender}*/,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(
                                                          color:
                                                              Colors.white70),
                                                ),
                                                Icon(Icons.circle,
                                                    size: 6,
                                                    color: Colors.white70),
                                                Text(
                                                  ' ${controller.Ufriends[i].Gender}' /* \u2B24  ${model.Gender}*/,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(
                                                          color:
                                                              Colors.white70),
                                                )
                                              ],
                                            ),
                                            Container(
                                              //color: Colors.amber,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 3.0),
                                                    child: Container(
                                                      child: Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          size: 15,
                                                          color:
                                                              Colors.white70),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      softWrap: true,
                                                      ' ${controller.Ufriends[i].Address}' /* \u2B24  ${model.Gender}*/,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall
                                                          ?.copyWith(
                                                            color:
                                                                Colors.white70,
                                                          ),
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            /*Row(
                                              children: [
                                                Icon(Icons.phone,
                                                    size: 15,
                                                    color: Colors.white70),
                                                Text(
                                                  ' ${controller.Ufriends[i].ContactNo == "" ? '-' : controller.Ufriends[i].ContactNo}' *//* \u2B24  ${model.Gender}*//*,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(
                                                          color:
                                                              Colors.white70),
                                                ),
                                              ],
                                            ),*/
                                          ],
                                        ),
                                      ),
                                    ),
                                    // IconButton(
                                    //   padding: EdgeInsets.zero,
                                    //   icon: const Icon(
                                    //     Icons.cancel_rounded,
                                    //     size: 36,
                                    //   ),
                                    //   onPressed: () {
                                    //     controller.saveFriends(i, 0);
                                    //   },
                                    // ),
                                    // IconButton(
                                    //   padding: EdgeInsets.zero,
                                    //   icon: const Icon(
                                    //     Icons.check_circle_rounded,
                                    //     size: 36,
                                    //   ),
                                    //   onPressed: () {
                                    //     controller.saveFriends(i, 1);
                                    //   },
                                    // ),
                                  ],
                                ),
                              ));
                        }),
                  ))
            //  CarouselSlider(
            //     options: CarouselOptions(height: 80.0),
            //     items: getpendingWidget(),
            //   )),
          ],
        ),
      )),
    );
  }

  getUserImage(int i, UsersModel model) {
    if (model.Gender == "M") {
      return Container(
        //     color: Colors.amber,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/boy${(i % 3) + 1}.jpg',
            fit: BoxFit.cover,
            // height: 72,
            // width: 72,
          ),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          fit: BoxFit.fitHeight,
          'assets/images/girl${(i % 3) + 1}.jpg',
          // height: 72,
          // width: 72,
        ),
      );
    }
  }

  void _handleSearch(String value) {
  }
}
