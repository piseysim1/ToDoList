import 'package:flutter/material.dart';

class Taskproject extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData iconTaskgroup;
  final Color bgIcon;
  final Color iconColor;
  final double values;
  final Color valuesColor;
  final Color bgvalues;
  final String textPercent;
  const Taskproject({
    super.key,
    required this.bgvalues,
    required this.title,
    required this.subTitle,
    required this.iconTaskgroup,
    required this.bgIcon,
    required this.iconColor,
    required this.values,
    required this.valuesColor,
    required this.textPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.blue.shade400, width: 2),
      ),
      child: Row(
        children: [
          // 1. Icon Section
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgIcon,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(iconTaskgroup, color: iconColor, size: 30),
          ),
          const SizedBox(width: 16),

          // 2. Text Section
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          // 3. Progress Section
          SizedBox(
            height: 60,
            width: 60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: values,
                  strokeWidth: 6,
                  backgroundColor: bgvalues,
                  valueColor: AlwaysStoppedAnimation<Color>(valuesColor),
                ),
                Text(
                  textPercent,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}