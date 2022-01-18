import 'package:flutter/material.dart';

import '../../constance.dart';

class CustomProducts extends StatelessWidget {
  final String image;
  final Function()? onTap;
  final String title;
  final String size;
  final String price;

  const CustomProducts({
    required this.image,
    this.onTap,
    required this.title,
    required this.size,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(image),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              strutStyle: const StrutStyle(fontSize: 17.0),
              text: TextSpan(
                  style: const TextStyle(color: secondaryColor), text: title),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text('Kích thước:'),
              Text(
                size,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: secondaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const Text(
                '(Đã bán 120)',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 13,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
