import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/taisanso/taisanso_detail_controller.dart';
import 'package:hoavien_app/views/widgets/custom_button_taisanso_detail.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class TaisansoDetailPage extends StatelessWidget {
  final controller = Get.put(TaisansoDetailController());
  TaisansoDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          centerTitle: false,
          elevation: 1,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: secondaryColor,
          ),
          title: Obx(
            () => CustomTitleText(
              title: controller.taisansoDetails.value?.name
                      .toString()
                      .toUpperCase() ??
                  'Thông tin tàn sản số',
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: const CircularProgressIndicator());
              } else {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageSlideshow(
                        /// Width of the [ImageSlideshow].
                        width: double.infinity,

                        /// Height of the [ImageSlideshow].

                        /// The page to show when first creating the [ImageSlideshow].
                        initialPage: 0,

                        /// The color to paint the indicator.
                        indicatorColor: secondaryColor,

                        /// The color to paint behind th indicator.
                        indicatorBackgroundColor: Colors.grey,

                        /// Called whenever the page in the center of the viewport changes.

                        /// Auto scroll interval.
                        /// Do not auto scroll with null or 0.
                        autoPlayInterval: 7000,

                        /// Loops back to first slide.
                        isLoop: true,

                        /// The widgets to display in the [ImageSlideshow].
                        /// Add the sample image file into the images folder
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              '$baseURL${controller.taisansoDetails.value?.avatar}',
                              fit: BoxFit.cover,
                            ),
                          ),
                          for (var i = 0;
                              i <
                                  num.parse(
                                      '${controller.taisansoDetails.value?.gallery?.length}');
                              i++) ...[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:
                                    '$baseURL${controller.taisansoDetails.value?.gallery![i].image}',
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        controller.taisansoDetails.value!.name.toString(),
                        style: const TextStyle(
                          color: secondaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(controller.taisansoDetails.value?.area?.name
                                  .toString() ??
                              ''),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(controller.taisansoDetails.value?.customer
                                      ?.fullname ==
                                  null
                              ? 'Chưa có chủ sở hữu'
                              : '${controller.taisansoDetails.value?.customer?.fullname}'),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButtonTaisansoDetail(
                          onTap: () {
                            Get.toNamed('/sodochidan');
                          },
                          icon: Icons.map,
                          title: 'Sơ đồ chỉ dẫn'),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButtonTaisansoDetail(
                        onTap: () {
                          print(controller.taisansoDetails.value?.certificate
                              .toString());
                        },
                        icon: Icons.book,
                        title: 'Sổ hồng',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButtonTaisansoDetail(
                          onTap: () {
                            print(controller
                                .taisansoDetails.value?.sale_contract
                                .toString());
                          },
                          icon: Icons.article_rounded,
                          title: 'Hợp đồng mua bán'),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomButtonTaisansoDetail(
                          icon: Icons.assignment, title: 'Hợp đồng xây dựng'),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomButtonTaisansoDetail(
                          icon: Icons.feed, title: 'Giấy tờ liên quan'),
                    ]);
              }
            }),
          ),
        ),
      ),
    );
  }
}
