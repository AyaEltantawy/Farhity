import 'package:get/get.dart';

import 'story_logic.dart';

class StoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoryLogic());
  }
}
