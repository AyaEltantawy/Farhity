import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'follower_profile_logic.dart';

class FollowerProfilePage extends StatelessWidget {
  const FollowerProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<FollowerProfileLogic>();
    final state = Get.find<FollowerProfileLogic>().state;

    return Container();
  }
}
