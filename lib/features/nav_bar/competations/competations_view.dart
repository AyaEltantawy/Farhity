import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'competations_logic.dart';

class CompetationsPage extends StatelessWidget {
  const CompetationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CompetationsLogic>();
    final state = Get.find<CompetationsLogic>().state;

    return Container();
  }
}
