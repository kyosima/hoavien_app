import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/saler/home/saler_home_controller.dart';
import 'package:hoavien_app/views/widgets/custom_shimmer.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../models/auth/user_model.dart';

class SalerHomePage extends GetView<SalerHomeController> {
  @override
  final controller = Get.put(SalerHomeController());
  final UserModel? user;
  SalerHomePage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          elevation: 1,
          centerTitle: false,
          title: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: const [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: secondaryColor,
                  ),
                  Icon(
                    Icons.person,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    user?.data?.userInfo?.fullname ?? "Saler",
                    style: const TextStyle(
                      wordSpacing: 0,
                      letterSpacing: 0,
                      color: secondaryColor,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Nh??n vi??n b??n h??ng',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
          actions: [
            Stack(
              alignment: Alignment.center,
              children: const [
                CircleAvatar(
                  radius: 17,
                  backgroundColor: secondaryColor,
                ),
                Icon(
                  Icons.search,
                  size: 18,
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Stack(
              alignment: Alignment.center,
              children: const [
                CircleAvatar(
                  radius: 17,
                  backgroundColor: secondaryColor,
                ),
                Icon(
                  Icons.phone_in_talk,
                  size: 18,
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/thongbaosaler');
              },
              child: Stack(
                alignment: Alignment.center,
                children: const [
                  CircleAvatar(
                    radius: 17,
                    backgroundColor: secondaryColor,
                  ),
                  Icon(
                    Icons.notifications_active,
                    size: 18,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    if (controller.isLoadingBanner.value) {
                      return Shimmer.fromColors(
                          baseColor: baseShimmer,
                          highlightColor: highLightShimmer,
                          child: const ShimmerBox(
                              height: 200, width: double.infinity));
                    } else {
                      return ImageSlideshow(
                        /// Width of the [ImageSlideshow].
                        width: double.infinity,

                        /// Height of the [ImageSlideshow].

                        /// The page to show when first creating the [ImageSlideshow].
                        initialPage: 0,

                        /// The color to paint the indicator.
                        indicatorColor: secondaryColor,

                        /// The color to paint behind th indicator.
                        indicatorBackgroundColor: Colors.grey,

                        /// The widgets to display in the [ImageSlideshow].
                        /// Add the sample image file into the images folder
                        children: [
                          for (var i = 0;
                              i <
                                  num.parse(controller.allBanner.value!.length
                                      .toString());
                              i++) ...[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                '$baseURL${controller.allBanner.value![i].image}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ]
                        ],

                        /// Called whenever the page in the center of the viewport changes.

                        /// Auto scroll interval.
                        /// Do not auto scroll with null or 0.
                        autoPlayInterval: 7000,

                        /// Loops back to first slide.
                        isLoop: true,
                      );
                    }
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomTitleText(title: '??ang m??? b??n'),
                ],
              ),
            ),
            Obx(
              () {
                if (controller.isLoadingArea.value) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 15),
                          child: Container(
                            decoration: BoxDecoration(
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
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Shimmer.fromColors(
                                baseColor: baseShimmer,
                                highlightColor: highLightShimmer,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const ShimmerBox(height: 80, width: 80),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          ShimmerBox(height: 15, width: 120),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ShimmerBox(height: 15, width: 130),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          ShimmerBox(height: 35, width: 150),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.allArea.value!.length,
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed('/chitietbatdongsan',
                                arguments: controller.allArea.value![index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15, top: 15),
                            child: Container(
                              decoration: BoxDecoration(
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
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '$baseURL${controller.allArea.value![index].avatar}',
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${controller.allArea.value![index].name}',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            controller.allArea.value![index]
                                                        .shortDesc ==
                                                    null
                                                ? ''
                                                : '${controller.allArea.value![index].shortDesc}',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: CustomTitleText(title: 'B???t ?????ng s???n chuy???n nh?????ng'),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  childAspectRatio: (0.60),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(controller.bdsCount.value, (index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/bds.png',
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'L?? 1 _ Khu Khang Minh',
                                  style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  '?? 500.000',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'L?? ?????t n???m t???i v??? tr?? H1.1 khu Khang Minh kjshdjkkjhkjsakdhjkahdkah',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
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
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: TextButton(
                child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: secondaryColor),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text('Xem th??m')),
                    )),
                onPressed: () {
                  controller.viewMoreBds();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
