import 'package:get/get.dart';

import 'competations_logic.dart';

class CompetationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompetationsLogic());
  }
}
