import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportcommunityapp/app/data/model/usermodel.dart';
import '/app/routes/app_pages.dart';

class Listitem extends StatelessWidget {
  final UsersModel dataModel;

  Listitem({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _getDetailsView(),
          ],
        ),
      ),
    );
  }

  Widget _getDetailsView() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              dataModel.Name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _onTap() {
    Get.toNamed(Routes.STUDENTS, arguments: dataModel);
  }
}
