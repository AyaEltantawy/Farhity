import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'menu_logic.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MenuLogic>();
    final state = Get.find<MenuLogic>().state;

    return Container();
  }
}
