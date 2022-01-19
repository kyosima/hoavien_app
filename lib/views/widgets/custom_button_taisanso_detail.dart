import 'package:flutter/material.dart';

import '../../constance.dart';

class CustomButtonTaisansoDetail extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onTap;
  const CustomButtonTaisansoDetail(
      {Key? key, required this.icon, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height / 18,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: colorText,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: colorText,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              const Icon(
                Icons.chevron_right,
                color: colorText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
