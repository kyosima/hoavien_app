import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hoavien_app/views/widgets/custom_products.dart';

import '../../../../../constance.dart';

class VatdungThocungPage extends StatelessWidget {
  const VatdungThocungPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 100,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.8,
                                0.0), // 10% of the width, so there are ten blinds.
                            colors: <Color>[
                              Color(0xffFF9900),
                              Color(0xffF5C037)
                            ], // red to yellow
                            // repeats the gradient over the canvas
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 15,
                        left: 30,
                        child: Text(
                          'Bộ lọc tìm kiếm',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              'Phân loại',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                    shape: CircleBorder(),
                                    value: true,
                                    onChanged: (value) {}),
                              ),
                              Text(
                                'Tất cả',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                    shape: CircleBorder(),
                                    value: true,
                                    onChanged: (value) {}),
                              ),
                              const Text(
                                'Dịch vụ xây dựng và thiết kế',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                    shape: CircleBorder(),
                                    value: true,
                                    onChanged: (value) {}),
                              ),
                              const Text(
                                'Vật dụng',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              'Khoảng giá',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Expanded(
                                  child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Giá tối thiểu',
                                ),
                              )),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Giá tối đa',
                                ),
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Mặc định'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FlatButton(
                    color: primaryColor,
                    onPressed: () {},
                    child: Text('Áp dụng'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 38,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Container(
            height: 40.0,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Directionality(
                textDirection: TextDirection.ltr,
                child: TextField(
                  controller: null,
                  autofocus: false,
                  style: const TextStyle(fontSize: 16.0, color: secondaryColor),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Tìm kiếm',
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 13.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ))),
        actions: [
          Builder(builder: (context) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Center(
                    child: IconButton(
                  icon: Icon(Icons.filter_alt),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ))
              ],
            );
          }),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Text('Sắp xếp kết quả',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ))),
                            TextButton(
                              onPressed: () {},
                              child: Row(children: [
                                Text(
                                  'Giá tăng dần',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Icon(
                                  Icons.add,
                                  color: Colors.red,
                                  size: 17,
                                ),
                              ]),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(children: [
                                Text(
                                  'Giá giảm dần',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Icon(
                                  Icons.remove,
                                  color: Colors.red,
                                  size: 17,
                                ),
                              ]),
                            ),
                          ],
                        ),
                      )),
                  isDismissible: true,
                  enableDrag: true,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sắp xếp giá',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: (0.64),

                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(10, (index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomProducts(
                              onTap: () => Get.toNamed('/productdetail'),
                              image: 'assets/images/product.png',
                              title: 'Đĩa hoa quả chất liệu đồng 3 chân',
                              size: 'D170 X H20',
                              price: 'đ 125.000'),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
