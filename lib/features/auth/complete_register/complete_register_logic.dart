import 'dart:convert';

import 'package:untitled3/core/app_storage/app_storage.dart';
import 'package:untitled3/core/dio_helper/dio_helper.dart';
import 'package:untitled3/core/models/user_model.dart';
import 'package:untitled3/core/network_state/network_state.dart';
import 'package:untitled3/routes/app_pages.dart';
import 'package:untitled3/utils/utils.dart';
import 'package:get/get.dart';

import 'complete_register_state.dart';

class CompleteRegisterLogic extends GetxController {
  final CompleteRegisterState state = CompleteRegisterState();

  onSubmit() async {
    if (!state.formKey.value.currentState!.validate()) return;
    state.networkState.value = NetworkState.LOADING;
    String? imageBase64;
    if (state.image.value != null) {
      final bytes = await state.image.value!.readAsBytes();
      imageBase64 = base64Encode(bytes);
    }
    update();
    final body = {
      "name": state.name.value.text,
      "gender": state.gender.value,
      "id": AppStorage.getUserId,
      "photo": null
    };
    print('body ${body}');
    await DioHelper.post('mobile/auth/register-user-page2/511844544', false,
            body: body)
        .then(
      (response) {
        final data = response.data as Map<String, dynamic>;
        if (data['status'] == 201) {
          AppStorage.cacheUserInfo(UserModel.fromJson(data));
          state.networkState.value = NetworkState.SUCCESS;
          update();
          Get.offNamed(Routes.login);
        } else {
          Utils.showSnackBar(data['msg'], isError: true);
          state.networkState.value = NetworkState.ERROR;
          update();
        }
      },
    );
  }
}
