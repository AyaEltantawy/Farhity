import 'package:untitled3/core/app_storage/app_storage.dart';
import 'package:untitled3/core/dio_helper/dio_helper.dart';
import 'package:untitled3/core/models/user_model.dart';
import 'package:untitled3/core/network_state/network_state.dart';
import 'package:untitled3/routes/app_pages.dart';
import 'package:untitled3/utils/utils.dart';
import 'package:get/get.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  login() async {
    if (!state.formKey.value.currentState!.validate()) return;
    state.networkState.value = NetworkState.LOADING;
    update();
    final body = {
      'phone': state.phone.value.text,
      'password': state.password.value.text,
      'id': AppStorage.getUserId,
    };
    print('body ${body}');
    await DioHelper.post('mobile/auth/login', false, body: body).then(
      (response) {
        final data = response.data as Map<String, dynamic>;
        if (data['status'] == 201) {
          AppStorage.cacheUserInfo(UserModel.fromJson(data));
          state.networkState.value = NetworkState.SUCCESS;
          update();
          Get.offNamed(Routes.navbar);
        } else {
        //  Utils.showSnackBar(data['msg'], isError: true);
          state.networkState.value = NetworkState.ERROR;
          update();
          Get.offNamed(Routes.navbar);
        }
      },
    );
  }
}
