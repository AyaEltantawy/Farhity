import 'package:untitled3/core/network_state/network_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterState {
  late Rx<GlobalKey<FormState>> formKey;
  late Rx<NetworkState> networkState;
  late RxString accountType;
  late RxBool isAgreed;
  late Rx<TextEditingController> userName;
  late Rx<TextEditingController> phone;
  late Rx<TextEditingController> password;
  late Rx<TextEditingController> passwordConfirmation;

  RegisterState() {
    formKey = GlobalKey<FormState>().obs;
    accountType = ''.obs;
    isAgreed = false.obs;
    userName = TextEditingController().obs;
    phone = TextEditingController().obs;
    password = TextEditingController().obs;
    passwordConfirmation = TextEditingController().obs;
    networkState = NetworkState.INITIAL.obs;
  }
}
