import 'package:flutter/material.dart';
import 'package:hoavien_app/constance.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final int? maxLines;
  final double? height;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final TextEditingController? controller;
  final IconData? icon;
  final Function()? onPressed;
  final String? hintText;
  final bool? enable;
  const CustomTextField({
    required this.title,
    this.obscureText = false,
    required this.inputType,
    this.controller,
    this.icon,
    this.validator,
    this.onPressed,
    this.maxLines,
    this.height = 55,
    this.hintText,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: height,
          width: double.infinity,
          child: TextField(
            enabled: enable,
            maxLines: maxLines,
            keyboardType: inputType,
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: title,
              hintText: hintText,
              labelStyle: const TextStyle(
                color: secondaryColor,
                fontSize: 20,
              ),
              floatingLabelStyle: const TextStyle(
                color: secondaryColor,
                fontSize: 20,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1.5, color: secondaryColor),
                borderRadius: BorderRadius.circular(15),
              ),
              suffixIcon: IconButton(
                onPressed: onPressed,
                icon: Icon(icon),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
