import 'package:flutter/material.dart';

class CustomButtonHomePage extends StatelessWidget {
  final String tittle;
  final IconData icon;
  final Function()? onTap;
  const CustomButtonHomePage({
    required this.tittle,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(
                        0.8, 0.0), // 10% of the width, so there are ten blinds.
                    colors: <Color>[
                      Color(0xffFF9900),
                      Color(0xffF5C037)
                    ], // red to yellow
                    // repeats the gradient over the canvas
                  ),
                ),
              ),
              Icon(
                icon,
                color: Colors.white,
                size: 32,
              )
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            tittle,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
