import 'package:untitled3/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp_state.dart';

class OtpLogic extends GetxController {
  final OtpState state = OtpState();

  bool _validateOtp() {
    return state.otpController1.value.text.isNotEmpty &&
        state.otpController2.value.text.isNotEmpty &&
        state.otpController3.value.text.isNotEmpty &&
        state.otpController4.value.text.isNotEmpty;
  }

  submitOtp() {
    if (_validateOtp()) {
      //todo : post request for otp
      Get.toNamed(Routes.completeRegister);
    } else {
      Get.snackbar(
        'خطأ',
        'الرجاء إدخال جميع أرقام OTP',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
