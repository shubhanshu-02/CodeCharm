import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Color? col;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final double? height;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText = '',
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textStyle,
    this.col,
    this.hintStyle,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = col ?? bgColor;
    return TextField(
      maxLines: obscureText ? 1 : null, // Obscured fields should not be multiline.
      keyboardType: obscureText ? TextInputType.text : keyboardType,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: height != null
            ? EdgeInsets.only(bottom: height!, left: 10, right: 10)
            : const EdgeInsets.symmetric(horizontal: 10),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 232, 245, 233),
          fontFamily: 'ProductSans',
          fontSize: 16,
        ),
        hintText: hintText,
        hintStyle: hintStyle ??
            TextStyle(
              color: Colors.grey[400],
              fontFamily: 'ProductSans',
            ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        fillColor: color,
        filled: true,
      ),
      style: textStyle ??
          const TextStyle(
            color: Colors.white,
            fontFamily: 'ProductSans', // Apply the font family here
          ),
    );
  }
}
