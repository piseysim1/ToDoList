import 'package:flutter/material.dart';

class TaskGroupcontainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData iconTaskgroup;
  final Color bgIcon;
  final Color iconColor;
  final double values;
  final Color valuesColor;
  final Color bgvalues;
  const TaskGroupcontainer({
    super.key,
    required this.bgvalues,
    required this.title,
    required this.subTitle,
    required this.iconTaskgroup,
    required this.bgIcon,
    required this.iconColor,
    required this.values,
    required this.valuesColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgIcon,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(iconTaskgroup, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 20,
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