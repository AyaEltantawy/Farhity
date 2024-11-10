import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class StoryCustom extends StatefulWidget {
  final String assetUrl1;
  final String assetUrl2;

  const StoryCustom(
      {super.key, required this.assetUrl1, required this.assetUrl2});

  @override
  State<StoryCustom> createState() => _StoryCustomState();
}

class _StoryCustomState extends State<StoryCustom> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors().purple),
            borderRadius: BorderRadius.circular(50)),
        child: CircleAvatar(
          radius: 80,
          backgroundColor: Colors.grey.shade200,
          child: Image.asset(widget.assetUrl1),
        ),
      ),
      Positioned(
        child: Container(
          width: 30,
          height: 30,
          child: CircleAvatar(
            radius: 10,
            child: Image.asset(widget.assetUrl2),
          ),
        ),
      )
    ]);
  }
}
