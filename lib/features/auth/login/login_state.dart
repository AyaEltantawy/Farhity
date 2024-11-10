import 'package:untitled3/core/network_state/network_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginState {
  late Rx<GlobalKey<FormState>> formKey;
  late Rx<TextEditingController> phone;
  late Rx<TextEditingController> password;
  late Rx<NetworkState> networkState;

  LoginState() {
    formKey = GlobalKey<FormState>().obs;
    phone = TextEditingController().obs;
    password = TextEditingController().obs;
    networkState = NetworkState.INITIAL.obs;
  }
}
