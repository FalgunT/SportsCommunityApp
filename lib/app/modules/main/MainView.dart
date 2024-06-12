import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sportcommunityapp/util/AppStrings.dart';

import '../../core/BaseView.dart';
import 'MainViewModel.dart';

class MainView extends BaseView<MainViewModel> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black54,
      title: Text(home),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Obx(()=>controller.widgetOptions.elementAt(controller.currentIndex.value)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        currentIndex: controller.currentIndex.value,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: other,
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
    );
  }
}
