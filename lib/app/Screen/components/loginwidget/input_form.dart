import 'package:flutter/material.dart';
import 'package:todolist_app/app/core/theme/theme.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    required this.borderRadius,
    this.controller,
    this.isObscure = false,
  });
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final BorderRadius borderRadius;
  final bool isObscure;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: whiteColor,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black45),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
