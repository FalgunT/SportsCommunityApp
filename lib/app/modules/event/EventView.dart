import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:sportcommunityapp/app/modules/event/EventViewModel.dart';

import '../../../util/Session.dart';
import '../../core/BaseView.dart';

class Eventview extends BaseView<EventViewModel> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {

    return AppBar(
      backgroundColor: Colors.black54,
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
    return Column();
  }
}
