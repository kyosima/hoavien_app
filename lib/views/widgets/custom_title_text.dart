import 'package:flutter/material.dart';

class CustomTitleText extends StatelessWidget {
  final String title;
  final double? fontSize;
  const CustomTitleText({
    required this.title,
    this.fontSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
