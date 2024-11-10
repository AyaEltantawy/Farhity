import 'package:get/get.dart';

import 'snapchat_logic.dart';

class SnapchatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SnapchatLogic());
  }
}
