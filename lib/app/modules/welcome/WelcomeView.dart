import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sportcommunityapp/app/modules/welcome/WelcomeViewModel.dart';
import 'package:sportcommunityapp/app/theme/ProjectTheme.dart';
import '../../core/BaseView.dart';

class WelcomeView extends BaseView<WelcomeViewModel> {
  WelcomeView() {
    // controller.getSchoolList();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    /*  return AppBar(
      title: Text('Welcome'),
    );*/
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            PageView.builder(
              controller: controller.pageController,
              onPageChanged: (int page) {
                controller.activePage.value = page;
              },
              itemCount: controller.pages.length,
              itemBuilder: (BuildContext context, int index) {
                return controller.pages[index % controller.pages.length];
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 100,
              child: Container(
                height: 200,
                width: 100,
                color: Colors.black54,
                child: SizedBox(
                    //   color: Colors.amber,
                    height: 25,
                    width: 100,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        //  color: Colors.green,
                        //width: size.width * 0.5,
                        children: [
                          Container(
                            //  alignment: Alignment.center,
                            height: 30,
                            width: 100,
                            //    color: Colors.green,
                            child: ListView.builder(
                                itemCount: controller.pages.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Obx(() => Column(
                                        children: [
                                          Center(
                                            child: AnimatedContainer(
                                              decoration: BoxDecoration(
                                                  color: controller.activePage
                                                              .value ==
                                                          index
                                                      ? Colors.white
                                                      : Colors.transparent,
                                                  border: Border.all(
                                                      width: 2,
                                                      color: controller
                                                                  .activePage
                                                                  .value ==
                                                              index
                                                          ? Colors.white
                                                          : Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              margin: EdgeInsets.all(4),
                                              width:
                                                  controller.activePage.value ==
                                                          index
                                                      ? 30
                                                      : 10,
                                              height: 10,
                                              duration: const Duration(
                                                  milliseconds: 3),
                                            ),
                                          ),
                                        ],
                                      ));
                                }),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    color: ProjectTheme.primaryColor,
                                    borderRadius: BorderRadius.circular(30)),
                                //  width: 200,
                                height: 50,
                                child: const Center(
                                  child: Text(
                                    "Get Started",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
