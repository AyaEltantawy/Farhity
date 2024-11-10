import 'package:untitled3/core/custom_widgets/loader.dart';
import 'package:untitled3/core/custom_widgets/submitBtn.dart';
import 'package:untitled3/core/custom_widgets/txtFormField.dart';
import 'package:untitled3/core/network_state/network_state.dart';
import 'package:untitled3/core/theme/app_colors.dart';
import 'package:untitled3/features/auth/complete_register/complete_register_view.dart';
import 'package:untitled3/features/auth/otp/otp_view.dart';
import 'package:untitled3/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register_logic.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<RegisterLogic>();
    final state = Get.find<RegisterLogic>().state;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: state.formKey.value,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(children: [
                const SizedBox(width: 90),
                SizedBox(
                  width: 171,
                  height: 9,
                  child: LinearProgressIndicator(
                    value: 0.5,
                    borderRadius: BorderRadius.circular(20),
                    backgroundColor: Colors.grey[300],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.purple),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    Get.toNamed(      Routes.completeRegister);
                  },
                  icon: const Icon(Icons.arrow_circle_right_rounded,
                      size: 40, color: Color(0xffD9D9D9)),
                )
              ]),
              const Text(
                "انشاء حساب جديد",
                style: TextStyle(fontSize: 20, color: Color(0xff1B002D)),
              ),
              const SizedBox(
                width: 320,
                height: 40,
                child: Text(
                  "قم بادخال البيانات المطلوبة لانشاء حساب جديد على التطبيق",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff777777),
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text("نوع الحساب",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff0F122C),
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 340,
                      height: 100,
                      child: DropdownButtonFormField<String>(
                        value: state.accountType.value.isEmpty
                            ? null
                            : state.accountType.value,
                        items: const [
                          DropdownMenuItem(
                            value: "influencer",
                            child: Text(
                              "حساب مشهور على منصات السوشيل ميديا",
                              style: TextStyle(
                                color: Color(0xff0F122C),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "storeOwner",
                            child: Text(
                              "حساب صاحب متجر الكتروني",
                              style: TextStyle(
                                color: Color(0xff0F122C),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "follower",
                            child: Text(
                              "حساب متابع",
                              style: TextStyle(
                                color: Color(0xff0F122C),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                        onChanged: (v) => logic.updateAccountType(v ?? ''),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Color(0xffF5F5F5),
                          filled: true,
                          hintText: "حدد مشهور أو متابع أو صاحب متجر",
                          alignLabelWithHint: false,
                        ),
                      ),
                    ),
                    const Text(
                      "الاسم الكامل",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff0F122C),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CustomTextForm(
                      lable: "",
                      hint: "",
                      myController: state.userName.value,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "الحقل فارغ";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("رقم الجوال",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff0F122C),
                            fontWeight: FontWeight.w500)),
                    CustomTextForm(
                        lable: "",
                        hint: "",
                        myController: state.phone.value,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "الحقل فارغ";
                          }
                          if (value.length != 10) {
                            return 'Phone number must be 10 digits';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("كلمة السر",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff0F122C),
                            fontWeight: FontWeight.w500)),
                    CustomTextForm(
                        lable: "",
                        hint: "",
                        myController: state.password.value,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "الحقل فارغ";
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("تاكيد كلمة السر",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff0F122C),
                            fontWeight: FontWeight.w500)),
                    CustomTextForm(
                        lable: "",
                        hint: "",
                        myController: state.passwordConfirmation.value,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "الحقل فارغ";
                          }
                          return null;
                        }),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          const Text(
                            ' الشروط والاحكام و سياسة الخصوصية',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff329BEE)),
                          ),
                          Text(
                            'أوافق علي',
                            style: TextStyle(
                                fontSize: 14, color: AppColors().purple),
                          ),
                          GetBuilder<RegisterLogic>(builder: (logic) {
                            return Checkbox(
                              value: state.isAgreed.value,
                              onChanged: (v) => logic.updateIsAgreed(v!),
                            );
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    GetBuilder<RegisterLogic>(builder: (logic) {
                      if (state.networkState.value == NetworkState.LOADING) {
                        return const Loader();
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Center(
                            child: SizedBox(
                              width: 358,
                              height: 56,
                              child: SubmitBtn(
                                onTap: () => logic.register(),
                                text: "انشاء حساب جديد",
                              ),
                            ),
                          ),
                        );
                      }
                    }),
                    const SizedBox(height: 30),
                    Center(
                      child: Text('أو من خلال',
                          style: TextStyle(color: Colors.grey[600])),
                    ),
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
                        Container(
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
                          icon: const Icon(Icons.camera_alt,
                              color: Colors.purple),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
