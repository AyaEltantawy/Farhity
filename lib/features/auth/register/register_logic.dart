import 'package:untitled3/core/app_storage/app_storage.dart';
import 'package:untitled3/core/dio_helper/dio_helper.dart';
import 'package:untitled3/core/models/user_model.dart';
import 'package:untitled3/core/network_state/network_state.dart';
import 'package:untitled3/features/auth/complete_register/complete_register_view.dart';
import 'package:untitled3/features/auth/complete_register/complete_register_view.dart';
import 'package:untitled3/routes/app_pages.dart';
import 'package:untitled3/utils/utils.dart';
import 'package:get/get.dart';

import 'register_state.dart';

class RegisterLogic extends GetxController {
  final RegisterState state = RegisterState();

  updateAccountType(String value) {
    state.accountType.value = value;
    update();
  }

  updateIsAgreed(bool value) {
    state.isAgreed.value = value;
    update();
  }

  Future<void> register() async {
    if (!state.formKey.value.currentState!.validate()) return;
    if (!state.isAgreed.value) {
      Utils.showSnackBar("يجب الموافقة على الشروط والأحكام");
      return;
    }
    state.networkState.value = NetworkState.LOADING;
    update();
    final body = {
      'type': state.accountType.value == 'influencer'
          ? '0'
          : state.accountType.value == 'storeOwner'
              ? '1'
              : '2',
      'phone': state.phone.value.text,
      'password': state.password.value.text,
      'password_confirmation': state.passwordConfirmation.value.text,
      'username': state.userName.value.text,
    };
    print('body ${body}');
    await DioHelper.post('mobile/auth/register-user-page1', false, body: body)
        .then(
      (response) {
        final data = response.data as Map<String, dynamic>;
        if (data['status'] == 201) {
          AppStorage.cacheUserInfo(UserModel.fromJson(data));
          state.networkState.value = NetworkState.SUCCESS;
          update();
          Get.offNamed(Routes.completeRegister);
        } else {
          Utils.showSnackBar(data['msg'], isError: true);
          state.networkState.value = NetworkState.ERROR;
          update();
        }
      },
    );
  }
}
