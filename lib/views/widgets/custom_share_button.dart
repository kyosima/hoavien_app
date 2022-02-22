import 'package:flutter/material.dart';

import '../../constance.dart';

class CustomShareButton extends StatelessWidget {
  final Function()? onTap;
  const CustomShareButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: secondaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const Center(
              child: Icon(
            Icons.share,
            size: 20,
          ))
        ],
      ),
    );
  }
}
