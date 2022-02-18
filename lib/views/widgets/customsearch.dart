import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';

class CustomSearch extends StatelessWidget {
  final Function()? onPressed;
  final Function(String)? onChanged;

  const CustomSearch({
    this.onPressed,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.0,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: TextField(
              onChanged: onChanged,
              controller: null,
              autofocus: false,
              style: const TextStyle(fontSize: 16.0, color: secondaryColor),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: onPressed,
                  icon: Icon(Icons.search),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Tìm kiếm',
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 13.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )));
  }
}
