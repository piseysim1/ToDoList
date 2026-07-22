import 'package:flutter/material.dart';
import 'package:todolist_app/app/core/theme/theme.dart';

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
        foregroundColor: whiteColor,
        backgroundColor: const Color(0xFF6338E1),
        shape: StadiumBorder(),
        elevation: 10,
        shadowColor: const Color(0xFF6338E1).withOpacity(0.4),
        
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
