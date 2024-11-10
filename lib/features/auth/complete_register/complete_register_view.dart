import 'package:untitled3/core/custom_widgets/loader.dart';
import 'package:untitled3/core/custom_widgets/txtFormField.dart';
import 'package:untitled3/core/network_state/network_state.dart';
import 'package:untitled3/core/theme/app_colors.dart';
import 'package:untitled3/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'complete_register_logic.dart';

class CompleteRegisterPage extends StatelessWidget {
  const CompleteRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CompleteRegisterLogic>();
    final state = Get.find<CompleteRegisterLogic>().state;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: state.formKey.value,
        child: Column(
          children: [
            const SizedBox(height: 60),
            Row(children: [
              const SizedBox(width: 70),
              SizedBox(
                width: 171,
                height: 9,
                child: LinearProgressIndicator(
                  value: 1,
                  borderRadius: BorderRadius.circular(20),
                  backgroundColor: Colors.grey[300],
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.purple),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () => Get.toNamed(Routes.login),
                icon: const Icon(
                  Icons.arrow_circle_right_rounded,
                  size: 40,
                  color: Color(0xffD9D9D9),
                ),
              ),
            ]),
            const SizedBox(height: 20),
            const Center(
              child: Column(
                children: [
                  Text(
                    'ادخل تفاصيل الحساب',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1B002D),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'قم بادخال تفاصيل الحساب لانشاء حساب جديد',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff777777),
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Obx(() =>      CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: state.image.value != null ? FileImage(state.image.value!) : null,
                  child: state.image.value == null ? Icon(Icons.person, size: 60) : null,
            )
                ),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors().purple,
                  child: IconButton(  icon: const Icon(Icons.camera_alt, color: Colors.white),
    onPressed: () => state.pickImage(),
                ),)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "اسم المستخدم",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff0F122C),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CustomTextForm(
                  hint: "Mohamed Ahmed",

                  myController: state.name.value,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    // Validation for name field
                    if (value == null || value.isEmpty) {
                      return "الحقل فارغ";
                    }
                    return null;
                  }, lable: '',
                ),
                const SizedBox(height: 10),
                const Text(
                  "حدد الجنس",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff0F122C),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 340,
                  height: 100,
                  child: DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(
                        value: "male",
                        child: Text(
                          "ذكر",
                          style: TextStyle(
                            color: Color(0xff0F122C),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "female",
                        child: Text(
                          "انثي",
                          style: TextStyle(
                            color: Color(0xff0F122C),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      state.gender.value = value ?? '';
                      // setState(() {
                      //   // Handle dropdown selection
                      // });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Color(0xffF5F5F5),
                      hintText: "حدد الجنس",
                      alignLabelWithHint: false,
                    ),
                    validator: (value) {
                      // Validation for dropdown
                      if (value == null || value.isEmpty) {
                        return "الرجاء اختيار الجنس";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GetBuilder<CompleteRegisterLogic>(builder: (logic) {
              if (state.networkState.value == NetworkState.LOADING) {
                return const Loader();
              } else {
                return SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () => logic.onSubmit(),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppColors().purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'اتمام التسجيل',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
