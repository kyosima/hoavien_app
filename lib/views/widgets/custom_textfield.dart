import 'package:flutter/material.dart';
import 'package:hoavien_app/constance.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final TextEditingController? controller;
  final IconData? icon;
  final Function()? onPressed;
  const CustomTextField({
    required this.title,
    this.obscureText = false,
    required this.inputType,
    this.controller,
    this.icon,
    this.validator,
    this.onPressed,
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
          height: 55,
          child: TextField(
            keyboardType: inputType,
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: title,
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
                borderSide: const BorderSide(width: 1, color: secondaryColor),
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
