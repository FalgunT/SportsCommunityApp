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
