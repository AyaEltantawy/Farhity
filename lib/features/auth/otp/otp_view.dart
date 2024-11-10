import 'package:untitled3/core/theme/app_colors.dart';
import 'package:untitled3/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp_logic.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<OtpLogic>();
    final state = Get.find<OtpLogic>().state;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const SizedBox(height: 20),
              Row(children: [
                const SizedBox(width: 70),
                SizedBox(
                  width: 171,
                  height: 9,
                  child: LinearProgressIndicator(
                    value: .75,
                    borderRadius: BorderRadius.circular(20),
                    backgroundColor: Colors.grey[300],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.purple),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.completeRegister);
                  },
                  icon: const Icon(
                    Icons.arrow_circle_right_rounded,
                    size: 40,
                    color: Color(0xffD9D9D9),
                  ),
                ),
              ]),
              const SizedBox(height: 30),
              const Text(
                'تحقق من رقم الجوال',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff1B002D),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'تم ارسال كود OTP المكون من 4  ارقام فى رسالة قصيرة على الرقم',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff777777),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '+955 545355345',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(width: 109),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.purple),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOtpBox(state.otpController1.value),
                  _buildOtpBox(state.otpController2.value),
                  _buildOtpBox(state.otpController3.value),
                  _buildOtpBox(state.otpController4.value),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => logic.submitOtp(),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppColors().purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'تحقق من الجوال',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'لم يصلك كود التحقق',
                style: TextStyle(fontSize: 16, color: Color(0xff0F122C)),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'اعادة ارسال الكود',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff329BEE),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpBox(TextEditingController controller) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24),
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.purple),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
