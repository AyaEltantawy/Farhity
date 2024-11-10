import 'package:get/get.dart';

import 'otp_logic.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpLogic());
  }
}
