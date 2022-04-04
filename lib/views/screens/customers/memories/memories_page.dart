import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/memories/memories_controller.dart';
import 'package:hoavien_app/views/widgets/custom_shimmer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

class MemoriesPage extends StatelessWidget {
  final controller = Get.put(MemoriesController());
  MemoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(child: Image.asset('assets/images/mienkyuc.png')),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/danhsachthanhvien');
            },
            icon: const Icon(
              Icons.people,
              color: colorText,
              size: 32,
            ),
          )
        ],
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
                              child: ShimmerBox(height: 100, width: 100),
                            ),
                          );
                        }),
                      );
                    } else {
                      return Stack(children: [
                        GridView.count(
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
                                Get.toNamed('/imagedetail',
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
                                    imageUrl:
                                        '$baseURL${controller.allImage.value![index].link}',
                                    fit: BoxFit.cover,
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
                  Obx(() {
                    if (controller.allVideo.value == null) {
                      return GridView.count(
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
                              child: ShimmerBox(height: 100, width: 100),
                            ),
                          );
                        }),
                      );
                    } else {
                      return Stack(children: [
                        GridView.count(
                          crossAxisCount: 3,
                          padding: const EdgeInsets.all(8),
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1 / 1.3,
                          // Generate 100 widgets that display their index in the List.
                          children: List.generate(
                              controller.allVideo.value!.length, (index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed('/imagedetail',
                                    arguments:
                                        controller.allVideo.value![index]);
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                ),
                                child:
                                    VideoPlayer(VideoPlayerController.network(
                                  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                                )),
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
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
