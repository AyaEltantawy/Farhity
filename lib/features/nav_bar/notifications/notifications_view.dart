import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notifications_logic.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<NotificationsLogic>();
    final state = Get.find<NotificationsLogic>().state;

    return Container();
  }
}
