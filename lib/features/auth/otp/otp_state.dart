import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpState {
  late Rx<TextEditingController> otpController1;
  late Rx<TextEditingController> otpController2;
  late Rx<TextEditingController> otpController3;
  late Rx<TextEditingController> otpController4;

  OtpState() {
    otpController1 = TextEditingController().obs;
    otpController2 = TextEditingController().obs;
    otpController3 = TextEditingController().obs;
    otpController4 = TextEditingController().obs;
  }
}
