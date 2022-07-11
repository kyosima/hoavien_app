import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/search_controller.dart';

class SearchResuftPage extends StatelessWidget {
  final SearchController controller = Get.put(SearchController());
  SearchResuftPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      GetBuilder<SearchController>(builder: (_) {
                        return ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.phanLoai.length,
                            itemBuilder: (_, index) {
                              return CheckboxListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title:
                                      Text(controller.phanLoai[index]['title']),
                                  value: controller.phanLoai[index]['isCheck'],
                                  onChanged: (value) {
                                    controller.isCheck(index);
                                  });
                            });
                      }),
                      const SizedBox(
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
                      icon: const Icon(Icons.search),
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
                  icon: const Icon(Icons.filter_alt),
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
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
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      strutStyle:
                                          const StrutStyle(fontSize: 19.0),
                                      text: const TextSpan(
                                          style: TextStyle(
                                            color: secondaryColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                          text: 'Cải táng hộc lưu tro HVBA '),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      'đ 500.000',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Flexible(
                                      child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        strutStyle:
                                            const StrutStyle(fontSize: 19.0),
                                        text: const TextSpan(
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
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
