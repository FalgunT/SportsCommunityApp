import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/BaseView.dart';
import 'OtherViewModel.dart';

//friends
class OtherView extends BaseView<OtherViewModel> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Center(child: Text("Other"))],
      ),
    );
  }
}
