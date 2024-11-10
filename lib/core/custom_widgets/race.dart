import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class RaceCustom extends StatefulWidget {
  final String text;
  final String assetUrl;

  const RaceCustom({super.key, required this.text, required this.assetUrl});

  @override
  State<RaceCustom> createState() => _RaceCustomState();
}

class _RaceCustomState extends State<RaceCustom> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(widget.text,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0F122C))),
              const Row(children: [
                Text("4 ايام مضت",
                    style: TextStyle(
                        color: Color(0xffBAC0CA),
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
                Icon(
                  Icons.timelapse,
                  color: Color(0xffBAC0CA),
                  size: 20,
                )
              ]),
            ],
          ),
          const SizedBox(width: 10),
          Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors().purple),
                  borderRadius: BorderRadius.circular(50)),
              child: CircleAvatar(
                backgroundImage: AssetImage(widget.assetUrl),
                radius: 40,
              ))
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      const Text("شاركنا اجابتك وسنختار 3 فائزين بالجائزة الكبري",
          style: TextStyle(
              color: Color(0xff1B002D),
              fontWeight: FontWeight.w400,
              fontSize: 14)),
      Container(
          width: 296,
          height: 283,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Image.asset("assets/images/Mask group.png"))
    ]);
  }
}
