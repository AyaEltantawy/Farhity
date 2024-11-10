import 'package:get/get.dart';

import 'follower_profile_logic.dart';

class FollowerProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FollowerProfileLogic());
  }
}
