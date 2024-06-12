import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sportcommunityapp/util/AppStrings.dart';

import '../../core/BaseView.dart';
import '../../core/paging_view.dart';
import 'InboxViewModel.dart';
import '../main/Listitem.dart';

class InboxView extends BaseView<InboxViewModel> {

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
