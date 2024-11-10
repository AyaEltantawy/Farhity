import 'package:untitled3/core/custom_widgets/loader.dart';
import 'package:untitled3/core/custom_widgets/submitBtn.dart';
import 'package:untitled3/core/custom_widgets/txtFormField.dart';
import 'package:untitled3/core/network_state/network_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_logic.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<LoginLogic>();
    final state = Get.find<LoginLogic>().state;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: state.formKey.value,
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: 163,
                height: 124,
                child: Image.asset(
                  "assets/images/Frame.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Column(
                children: [
                  Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1B002D)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'ادخل بياناتك لتسجيل الدخول للتطبيق ',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff777777),
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 350,
              height: 100,
              child: CustomTextForm(
                // preffix: const Text('+955'),
                lable: 'رقم الجوال',
                hint: '   xxx',
                myController: state.phone.value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.length != 10) {
                    return 'Phone number must be 10 digits';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: 350,
              height: 100,
              child: CustomTextForm(
                lable: 'كلمة المرور',
                hint: '',
                myController: state.password.value,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<LoginLogic>(builder: (logic) {
              return state.networkState.value == NetworkState.LOADING
                  ? const Loader()
                  : SizedBox(
                      width: 350,
                      height: 56,
                      child: SubmitBtn(
                        onTap: () => logic.login(),
                        text: "اتمام التسجيل",
                      ),
                    );
            }),
            const SizedBox(height: 20),
            Center(
              child:
                  Text('أو من خلال', style: TextStyle(color: Colors.grey[600])),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.cancel, color: Colors.purple),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      "assets/images/uim_snapchat-ghost.png",
                      fit: BoxFit.fill,
                    )),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt, color: Colors.purple),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 70),
              child: Row(
                children: [
                  Text('انشاء حساب جديد',
                      style: TextStyle(fontSize: 14, color: Color(0xff329BEE))),
                  Text(
                    ' لا تمتلك حساب ؟  ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
