import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/controllers/customers/home/search_controller.dart';

import '../../../../constance.dart';

class SearchResuftPage extends GetView<SearchController> {
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
                                child: Obx(
                                  () => Checkbox(
                                      shape: CircleBorder(),
                                      value: controller.isCheckedAll.value,
                                      onChanged: (value) {
                                        controller.checkboxAll();
                                      }),
                                ),
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
                                child: Obx(
                                  () => Checkbox(
                                      shape: CircleBorder(),
                                      value: controller.isCheckedService.value,
                                      onChanged: (value) {
                                        controller.checkboxService();
                                      }),
                                ),
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
                                child: Obx(
                                  () => Checkbox(
                                      shape: CircleBorder(),
                                      value: controller.isCheckedItem.value,
                                      onChanged: (value) {
                                        controller.checkboxItem();
                                      }),
                                ),
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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/search_resuft.png',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  strutStyle: StrutStyle(fontSize: 19.0),
                                  text: TextSpan(
                                      style: TextStyle(
                                        color: secondaryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                      text: 'Cải táng hộc lưu tro HVBA '),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'đ 500.000',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Flexible(
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    strutStyle: StrutStyle(fontSize: 19.0),
                                    text: TextSpan(
                                        style: TextStyle(
                                          color: secondaryColor,
                                        ),
                                        text:
                                            'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình An'),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
