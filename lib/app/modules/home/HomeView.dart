import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../core/BaseView.dart';
import '../../core/paging_view.dart';
import 'HomeViewModel.dart';
import 'Listitem.dart';

class HomeView extends BaseView<HomeViewModel> {
  HomeView() {
    controller.getSchoolList();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: Text('Home'),
    );
  }

  @override
  Widget body(BuildContext context) {
    return PagingView(
      onRefresh: () async {
        controller.onRefreshPage();
      },
      onLoadNextPage: () {
        controller.onLoadNextPage();
      },
      child: Padding(
        padding:  EdgeInsets.all(8),
        child: Obx(
          () => ListView.separated(
            shrinkWrap: true,
            itemCount: controller.schools.length,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var model = controller.schools[index];
              return Listitem(dataModel: model);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 2),
          ),
        ),
      ),
    );
  }
}
