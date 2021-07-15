import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputField extends StatelessWidget {
  TextInputField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.prefixIcon,
      this.suffixText,
      this.fontSize = 28,
      this.fillColor = const Color(0xFFF3F8FB),
      this.keyboardType = TextInputType.number,
      required this.onChanged})
      : super(key: key);

  final TextEditingController controller;
  final Function(String) onChanged;
  final IconData? prefixIcon;
  final String? suffixText;
  final String hintText;
  final Color fillColor;
  final double fontSize;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          border: InputBorder.none,
          hintText: hintText,
          suffixText: suffixText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null),
      textAlign: TextAlign.end,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF00474B)),
    );
  }
}
