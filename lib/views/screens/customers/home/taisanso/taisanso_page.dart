import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/taisanso/taisanso_controller.dart';
import 'package:hoavien_app/views/widgets/custom_shimmer.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class TaiSanSoPage extends GetView<TaisansoController> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  TaiSanSoPage({Key? key}) : super(key: key);

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      GetBuilder<TaisansoController>(builder: (_) {
                        if (controller.isLoadingArea.value) {
                          return const CircularProgressIndicator();
                        } else {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(0),
                              shrinkWrap: true,
                              itemCount: controller.allArea.value!.length,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: TextButton(
                                      child: Text(
                                        controller.allArea.value![index].name
                                            .toString(),
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      onPressed: () {
                                        print(controller
                                            .allArea.value![index].id);
                                      },
                                    ),
                                  ),
                                );
                              });
                        }
                      }),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 70,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: TextField(
                                  onChanged: (value) {},
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
              Obx(() {
                if (controller.isLoadingTaisanso.value) {
                  return Expanded(
                    child: ListView.builder(
                        padding:
                            const EdgeInsets.only(top: 5, left: 15, right: 15),
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Shimmer.fromColors(
                                  baseColor: baseShimmer,
                                  highlightColor: highLightShimmer,
                                  child: Row(
                                    children: [
                                      const ShimmerBox(height: 80, width: 80),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            ShimmerBox(
                                              height: 20,
                                              width: 150,
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            ShimmerBox(
                                              height: 20,
                                              width: 150,
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            ShimmerBox(
                                              height: 20,
                                              width: 140,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
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
                          );
                        }),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                        padding:
                            const EdgeInsets.only(top: 5, left: 15, right: 15),
                        itemCount:
                            controller.allTaisanso.value?.dataTaisanso?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed('/taisansodetail',
                                  arguments: controller.allTaisanso.value
                                      ?.dataTaisanso![index].id);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      CachedNetworkImage(
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            '$baseURL${controller.allTaisanso.value?.dataTaisanso![index].avatar}',
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
                                                  text: controller
                                                      .allTaisanso
                                                      .value
                                                      ?.dataTaisanso![index]
                                                      .name),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '${controller.allTaisanso.value?.dataTaisanso![index].area?.name}',
                                              style: const TextStyle(
                                                  color: secondaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Chủ sở hữu : 123',
                                              style: TextStyle(
                                                  color: secondaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300),
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
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
