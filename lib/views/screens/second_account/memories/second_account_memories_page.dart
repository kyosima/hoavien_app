import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/second_account/memories/secondaccount_memory_controller.dart';
import 'package:hoavien_app/views/screens/customers/memories/image_detail_page.dart';
import 'package:hoavien_app/views/screens/second_account/memories/second_account_detail_image_page.dart';
import 'package:hoavien_app/views/widgets/custom_add_gallery.dart';
import 'package:hoavien_app/views/widgets/custom_shimmer.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shimmer/shimmer.dart';

class SecondAccountMemoriesPage extends StatelessWidget {
  final controller = Get.put(SecondAccountMemoryController());
  final ImageMemories = [
    'https://placeimg.com/640/480/any',
    'https://placeimg.com/640/480/any',
    'https://placeimg.com/640/480/any',
    'https://placeimg.com/640/480/any',
    'https://placeimg.com/640/480/any',
    'https://placeimg.com/640/480/any',
    'https://placeimg.com/640/480/any',
    'https://placeimg.com/640/480/any',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(child: Image.asset('assets/images/mienkyuc.png')),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ButtonsTabBar(
                backgroundColor: primaryColor,
                unselectedBackgroundColor: Colors.white,
                unselectedLabelStyle: const TextStyle(color: secondaryColor),
                labelStyle: const TextStyle(
                    letterSpacing: 2,
                    fontSize: 16,
                    color: secondaryColor,
                    fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    text: "Ảnh",
                  ),
                  Tab(
                    text: "Video",
                  ),
                  Tab(
                    text: "Album",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Obx(() {
                    if (controller.allImage.value == null) {
                      return GridView.count(
                        // Create a grid with 2 columns. If you change the scrollDirection to
                        // horizontal, this produces 2 rows.
                        crossAxisCount: 3,
                        padding: const EdgeInsets.all(8),
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1 / 1.3,
                        // Generate 100 widgets that display their index in the List.
                        children: List.generate(12, (index) {
                          return Shimmer.fromColors(
                            baseColor: baseShimmer,
                            highlightColor: highLightShimmer,
                            child: const ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                              child: ShimmerBox(
                                height: 100,
                                width: 100,
                              ),
                            ),
                          );
                        }),
                      );
                    } else {
                      return Stack(children: [
                        GridView.count(
                          // Create a grid with 2 columns. If you change the scrollDirection to
                          // horizontal, this produces 2 rows.
                          crossAxisCount: 3,
                          padding: const EdgeInsets.all(8),
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1 / 1.3,
                          // Generate 100 widgets that display their index in the List.
                          children: List.generate(
                              controller.allImage.value!.length, (index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => SecondAccountImageDetailPage(),
                                    arguments:
                                        controller.allImage.value![index]);
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                ),
                                child: Hero(
                                  tag:
                                      '${controller.allImage.value![index].link}',
                                  child: CachedNetworkImage(
                                    // width: 300,
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        '$baseURL${controller.allImage.value![index].link}',
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        Positioned(
                            bottom: 15,
                            right: 15,
                            child: InkWell(
                              onTap: () {
                                controller.pickImageFromGalerry();
                              },
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: const LinearGradient(
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
                                  height: 70,
                                  width: 70,
                                ),
                                const Icon(
                                  Icons.add,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ]),
                            ))
                      ]);
                    }
                  }),
                  const Center(
                    child: Icon(Icons.directions_transit),
                  ),
                  Stack(children: [
                    GridView.count(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(8),
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1 / 1.6,
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(ImageMemories.length, (index) {
                        return InkWell(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                ),
                                child: Image.network(
                                  ImageMemories[index],
                                  height: 200,
                                  // width: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Ảnh cưới gia đình',
                                style: TextStyle(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '1802',
                                style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    Positioned(
                      bottom: 15,
                      right: 15,
                      child: CustomAddGalleryButton(
                        onTap: () {
                          Get.bottomSheet(
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              height: 250,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Tạo một album',
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const CustomTextField(
                                      maxLines: 1,
                                      title: 'Tên Album',
                                      inputType: TextInputType.text,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 130,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: secondaryColor)),
                                              child: const Center(
                                                  child: Text(
                                                'Hủy',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              )),
                                            )),
                                        TextButton(
                                            onPressed: () {},
                                            child: Container(
                                              height: 40,
                                              width: 130,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: primaryColor,
                                              ),
                                              child: const Center(
                                                  child: Text(
                                                'Ok',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              )),
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
