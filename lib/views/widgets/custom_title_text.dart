import 'package:flutter/material.dart';
import 'package:hoavien_app/constance.dart';

class CustomTitleText extends StatelessWidget {
  final String title;
  final double? fontSize;
  const CustomTitleText({
    required this.title,
    this.fontSize = 17,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: secondaryColor,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
