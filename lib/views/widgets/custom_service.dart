import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constance.dart';

class CustomService extends StatelessWidget {
  final String image;
  final String title;
  final String priceSale;
  final String price;
  final String info;
  final Function()? onTap;

  const CustomService(
      {required this.image,
      required this.title,
      required this.price,
      required this.priceSale,
      required this.info,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 3, right: 10, top: 10, bottom: 10),
        child: Container(
          width: 243.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  height: 135,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: image,
                ),
                const SizedBox(
                  height: 5,
                ),
                Flexible(
                  flex: 2,
                  child: RichText(
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    strutStyle: const StrutStyle(fontSize: 19.0),
                    text: TextSpan(
                        style: const TextStyle(
                            fontSize: 15,
                            color: secondaryColor,
                            fontWeight: FontWeight.w500),
                        text: title),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      priceSale,
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    strutStyle: const StrutStyle(fontSize: 19.0),
                    text: TextSpan(
                        style: const TextStyle(
                          color: secondaryColor,
                        ),
                        text: info),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
