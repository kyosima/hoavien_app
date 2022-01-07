import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextInputType inputType;
  const CustomTextField({
    required this.title,
    required this.hintText,
    this.obscureText = false,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 55,
          child: TextField(
            obscureText: obscureText,
            keyboardType: inputType,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
