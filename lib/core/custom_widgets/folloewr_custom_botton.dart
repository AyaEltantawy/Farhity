import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SubmitBtn1 extends StatelessWidget {
  const SubmitBtn1({super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            //border: Border.all(color: AppColors().p, width: 4),
              borderRadius: BorderRadius.circular(30),
              color: AppColors().purple,
              boxShadow: const [
                BoxShadow(blurRadius: 2, offset: Offset(0, 2))
              ]),
          child: Center(
              child: Text(
                text,
                style: TextStyle(color: AppColors().white, fontSize: 16),
              )),
        ));
  }
}
