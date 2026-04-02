import 'package:flutter/material.dart';

class Titleheader extends StatelessWidget {
  const Titleheader({
    super.key,
    required this.lable_text,
  
  });
  final String lable_text;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              lable_text,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
            ),
          ],
        ),
      ],
    );
  }
}