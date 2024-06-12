import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportcommunityapp/util/AppStrings.dart';

import '../../core/BaseView.dart';
import 'HomeViewModel.dart';

class HomeView extends BaseView<HomeViewModel> {

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
