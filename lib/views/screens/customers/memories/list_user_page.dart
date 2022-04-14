import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/memories/list_user_controller.dart';
import 'package:hoavien_app/views/widgets/custom_shimmer.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:shimmer/shimmer.dart';

class ListUserPage extends StatelessWidget {
  final controller = Get.put(ListUserController());
  ListUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        elevation: 0,
        title: const CustomTitleText(
          title: 'Danh sách thành viên',
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Obx(() {
              if (controller.isLoading.value) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: 7,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.black.withOpacity(0.1),
                                    highlightColor:
                                        Colors.white.withOpacity(0.5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const CircleAvatar(
                                              radius: 40,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                ShimmerBox(
                                                    height: 17, width: 160),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                ShimmerBox(
                                                    height: 16, width: 170),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                ShimmerBox(
                                                    height: 15, width: 140),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                );
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: controller.allUser.value!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                              radius: 40,
                                              backgroundImage: controller
                                                          .allUser
                                                          .value![index]
                                                          .avatar ==
                                                      null
                                                  ? const AssetImage(
                                                      defaultUser)
                                                  : CachedNetworkImageProvider(
                                                          '$baseURL${controller.allUser.value![index].avatar}')
                                                      as ImageProvider),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller
                                                    .allUser.value![index].phone
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                'Họ tên: ${controller.allUser.value![index].userInfo?.fullname}',
                                                style: const TextStyle(
                                                  color: secondaryColor,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                'Quan hệ: ${controller.allUser.value![index].userInfo?.relationship}',
                                                style: const TextStyle(
                                                  color: secondaryColor,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                );
              }
            })),
      ),
    );
  }
}
