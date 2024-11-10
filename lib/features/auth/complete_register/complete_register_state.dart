import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:untitled3/core/network_state/network_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteRegisterState {
  Rx<File?> image = Rx<File?>(null);
  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }

  }

  late Rx<GlobalKey<FormState>> formKey;
  late Rx<TextEditingController> name;
  late RxString gender;
  late Rx<NetworkState> networkState;

  CompleteRegisterState() {
    formKey = GlobalKey<FormState>().obs;
    name = TextEditingController().obs;
    networkState = NetworkState.INITIAL.obs;
    gender = ''.obs;
  }
}
