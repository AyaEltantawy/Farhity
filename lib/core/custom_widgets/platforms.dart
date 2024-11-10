import 'package:flutter/material.dart';

class PlatformsCustom extends StatefulWidget {
  final String text;
  final String assetUrl;
  final Color color; // New color parameter

  PlatformsCustom({
    super.key,
    required this.text,
    required this.assetUrl,
    required this.color, // Make color a required parameter
  });

  @override
  State<PlatformsCustom> createState() => _PlatformsState();
}

class _PlatformsState extends State<PlatformsCustom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 109,
          height: 110,
          decoration: BoxDecoration(
            color: widget.color, // Use widget.color here
            borderRadius: BorderRadius.circular(20),
          ),
          child: GestureDetector(
            child: Container(
              width: 56,
              height: 56,
              child: Image.asset(
                widget.assetUrl, // Access assetUrl via widget
              ),
            ),
          ),
        ),
        Text(
          widget.text, // Directly using widget.text
          style: TextStyle(
            color: Color(0xff1B002D),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
