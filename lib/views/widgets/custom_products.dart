import 'package:flutter/material.dart';

import '../../constance.dart';

class CustomProducts extends StatelessWidget {
  final String image;
  final Function()? onTap;
  final String title;
  final String size;
  final String price;

  // ignore: use_key_in_widget_constructors
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image,
            fit: BoxFit.cover,
            height: 140,
            width: double.infinity,
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              strutStyle: const StrutStyle(
                fontSize: 16.0,
              ),
              text: TextSpan(
                  style: const TextStyle(
                      color: secondaryColor, fontWeight: FontWeight.w600),
                  text: title),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text('KT:'),
              Text(
                size,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: secondaryColor,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            price,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
