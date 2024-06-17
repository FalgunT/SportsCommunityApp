import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sportcommunityapp/app/theme/ProjectTheme.dart';
import 'package:sportcommunityapp/util/AppStrings.dart';

import '../../../util/Session.dart';
import '../../core/BaseView.dart';
import 'MainViewModel.dart';

class MainView extends BaseView<MainViewModel> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectTheme.primaryColorTrans,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 10,
          width: 10,
          padding: const EdgeInsets.all(0.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Image.asset(
            'assets/icons/ic_launcher.png',
            fit: BoxFit.fill,
            //   fit: BoxFit.fitHeight,
            // height: 122,
            // width: 122,
          ),
        ),
      ),

      //  CircleAvatar(
      //   backgroundColor: Colors.white,
      //   child: Padding(
      //     padding: const EdgeInsets.all(0.0),
      //     child: Image.asset(
      //       'assets/icons/ic_launcher.png',
      //       fit: BoxFit.cover,
      //       // height: 122,
      //       // width: 122,
      //     ),
      //   ),
      // ),
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

  @override
  Widget body(BuildContext context) {
    return Scaffold(
        body: Obx(() =>
            controller.widgetOptions.elementAt(controller.currentIndex.value)),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            backgroundColor: ProjectTheme.primaryAccentColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: ProjectTheme.primaryColor,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: home,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_rounded),
                label: friends,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.mail),
                label: inbox,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: profile,
              )
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
              // this has changed
              /*   setState(() {
            _currentIndex = index;
          });*/
            },
          ),
        ));
  }
}
