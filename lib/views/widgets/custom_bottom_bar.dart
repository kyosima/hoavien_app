import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
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
          height: 80,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 35,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Tư vấn ngay',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.shopping_cart_sharp,
                      color: Colors.white,
                      size: 35,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Thêm vào giỏ hàng',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.shopping_basket,
                      color: Colors.white,
                      size: 35,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Mua hàng ngay',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      elevation: 0,
    );
  }
}
