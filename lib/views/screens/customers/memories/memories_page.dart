import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/memories/memories_controller.dart';
import 'package:hoavien_app/views/widgets/custom_add_gallery.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:photo_view/photo_view.dart';

class MemoriesPage extends StatelessWidget {
  final MemoriesController controller = Get.put(MemoriesController());
  final ImageMemories = [
    'https://placeimg.com/640/480/any',
    'https://placeimg.com/640/480/any',
    'https://placeimg.com/640/480/any',
    'https://placeimg.com/640/480/any',
    'https://placeimg.com/640/480/any',
    'https://placeimg.com/640/480/any',
    'https://placeimg.com/640/480/any',
    'https://placeimg.com/640/480/any',
    'https://placeimg.com/640/480/any',
    'https://placeimg.com/640/480/any',
  ];

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
                  Stack(children: [
                    GridView.count(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 3,
                      padding: const EdgeInsets.all(8),
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1 / 1.3,
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(ImageMemories.length, (index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed('/imagedetail',
                                arguments: ImageMemories[index]);
                          },
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                            ),
                            child: Image.network(
                              ImageMemories[index],
                              // width: 300,
                              fit: BoxFit.cover,
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
                          child: Stack(alignment: Alignment.center, children: [
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
                            Icon(
                              Icons.add,
                              size: 40,
                              color: Colors.white,
                            ),
                          ]),
                        ))
                  ]),
                  Stack(children: [
                    Positioned(
                        bottom: 15,
                        right: 15,
                        child: InkWell(
                          onTap: () {
                            controller.pickVideoFromGalerry();
                          },
                          child: Stack(alignment: Alignment.center, children: [
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
                            Icon(
                              Icons.add,
                              size: 40,
                              color: Colors.white,
                            ),
                          ]),
                        ))
                  ]),
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
                                borderRadius: BorderRadius.only(
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
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Ảnh cưới gia đình',
                                style: TextStyle(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
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
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              height: 250,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Tạo một album',
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextField(
                                      maxLines: 1,
                                      title: 'Tên Album',
                                      inputType: TextInputType.text,
                                    ),
                                    SizedBox(
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
                                              child: Center(
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
                                              child: Center(
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
