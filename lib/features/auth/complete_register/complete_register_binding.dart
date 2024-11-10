import 'package:get/get.dart';

import 'complete_register_logic.dart';

class CompleteRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompleteRegisterLogic());
  }
}
