import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/BaseView.dart';
import 'ProfileViewModel.dart';

class ProfileView extends BaseView<ProfileViewModel> {
  ProfileView() {
    controller.getUser();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return const Scaffold(
      body: Column(),
    );
  }
}
