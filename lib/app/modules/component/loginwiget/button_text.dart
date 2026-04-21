import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({
    super.key,
    required this.buttonName,
    this.onPressed,
    required this.BGbotton,
  });
  final String? buttonName;
  final VoidCallback? onPressed;
  final Color BGbotton;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: BGbotton,
      ),
      child: Row(
        children: [
          Text(
            buttonName ?? "Button",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10),
          Icon(Icons.play_arrow_rounded, color: Colors.white),
        ],
      ),
    );
  }
}
