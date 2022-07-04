import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/genealogy/genealogy_controller.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:intl/intl.dart';

class GenealogyPage extends StatelessWidget {
  final GenealogyController controller = Get.put(GenealogyController());
  GenealogyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const CustomTitleText(
            title: 'Gia phả',
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.toNamed('/taogiapha');
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: secondaryColor,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.add_circle,
                          color: colorText,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Tạo gia phả',
                          style: TextStyle(color: colorText),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Container(
            child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(children: [
                  GetBuilder<GenealogyController>(builder: (_) {
                    if (controller.isLoading.value) {
                      return Container();
                    } else {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: controller.allGenalogy.value?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
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
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${controller.allGenalogy.value![index].name} ',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: secondaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.people,
                                              color: colorText,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Số thành viên: ${controller.allGenalogy.value![index].memberCount}',
                                              style: TextStyle(
                                                color: colorText,
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.timer_outlined,
                                              color: colorText,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Ngày tạo: ' +
                                                  '${controller.allGenalogy.value![index].createdAt != null ? DateFormat('dd/MM/yyyy '
                                                      'hh:mm a').format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(controller.allGenalogy.value![index].createdAt.toString())) : ""}',
                                              style: TextStyle(
                                                color: colorText,
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: colorText,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '${controller.allGenalogy.value![index].address}',
                                              style: TextStyle(
                                                color: colorText,
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: const [
                                            Icon(
                                              Icons.person,
                                              color: colorText,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Người tạo: Trần Hồng',
                                              style: TextStyle(
                                                color: colorText,
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xffFBE5AF),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              height: 40,
                                              child: TextButton(
                                                  onPressed: () {},
                                                  child: Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.delete,
                                                        size: 16,
                                                      ),
                                                      Text('Xóa'),
                                                    ],
                                                  )),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              height: 40,
                                              child: TextButton(
                                                  onPressed: () {},
                                                  child: Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.edit,
                                                        size: 16,
                                                      ),
                                                      Text('Sửa thông tin'),
                                                    ],
                                                  )),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xff865841),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              height: 40,
                                              child: TextButton(
                                                  onPressed: () {
                                                    Get.toNamed(
                                                        '/chitietgiapha');
                                                  },
                                                  child: Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.bubble_chart,
                                                        size: 16,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        'Cây gia phả',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                  }),
                ]))));
  }
}
