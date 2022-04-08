import 'package:flutter/material.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/taisanso/taisanso_controller.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:hoavien_app/views/widgets/customsearch.dart';
import 'package:get/get.dart';

class TaiSanSoPage extends GetView<TaisansoController> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: Drawer(
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
                            'Phân loại theo khu',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GetBuilder<TaisansoController>(
                            builder: (_) => ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(0),
                                shrinkWrap: true,
                                itemCount: controller.phanLoaiKhu.length,
                                itemBuilder: (_, index) {
                                  return CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text(controller.phanLoaiKhu[index]
                                          ['name']),
                                      value: controller.phanLoaiKhu[index]
                                          ['isCheck'],
                                      onChanged: (value) {
                                        controller.isCheck(index);
                                      });
                                })),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Mặc định'),
                ),
                const SizedBox(
                  width: 20,
                ),
                FlatButton(
                  color: primaryColor,
                  onPressed: () {},
                  child: const Text('Áp dụng'),
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: secondaryColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 1,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.white,
        title: const CustomTitleText(
          title: 'Tài sản số',
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      child: SizedBox(
                        height: 45,
                        child: Container(
                            height: 40.0,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    const Radius.circular(10))),
                            child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: TextField(
                                  onChanged: (value) {
                                    controller.findTaisanso(value);
                                  },
                                  autofocus: false,
                                  style: const TextStyle(
                                      fontSize: 16.0, color: secondaryColor),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Tìm kiếm',
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 13.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ))),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _key.currentState!.openEndDrawer();
                    },
                    icon: const Icon(Icons.filter_alt),
                  )
                ],
              ),
              Obx(
                () => Expanded(
                  child: ListView.builder(
                      padding:
                          const EdgeInsets.only(top: 5, left: 15, right: 15),
                      itemCount: controller.foundTaisanso.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed('/taisansodetail');
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/taisanso.png',
                                      width: 80,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            strutStyle: const StrutStyle(
                                                fontSize: 19.0),
                                            text: TextSpan(
                                                style: const TextStyle(
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 19,
                                                ),
                                                text: controller.foundTaisanso
                                                    .value[index]['name']),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'Thuộc khu :',
                                                style: TextStyle(
                                                    color: secondaryColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                controller.foundTaisanso
                                                    .value[index]['location'],
                                                style: const TextStyle(
                                                    color: secondaryColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'Chủ sở hữu :',
                                                style: TextStyle(
                                                    color: secondaryColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                controller.foundTaisanso
                                                    .value[index]['host'],
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
