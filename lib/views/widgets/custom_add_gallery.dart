import 'package:flutter/material.dart';

class CustomAddGalleryButton extends StatelessWidget {
  final Function()? onTap;
  const CustomAddGalleryButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(alignment: Alignment.center, children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
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
          height: 70,
          width: 70,
        ),
        const Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ]),
    );
  }
}
