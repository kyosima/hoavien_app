import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/widgets/custom_button_taisanso_detail.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:get/get.dart';

class TaisansoDetailPage extends StatelessWidget {
  const TaisansoDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: secondaryColor,
          ),
          title: const CustomTitleText(
            title: 'PQ2.3-02-01',
          )),
      body: Container(
        height: double.infinity,
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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

              /// The widgets to display in the [ImageSlideshow].
              /// Add the sample image file into the images folder
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'assets/images/banner.png',
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'assets/images/banner.png',
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'assets/images/banner.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],

              /// Called whenever the page in the center of the viewport changes.

              /// Auto scroll interval.
              /// Do not auto scroll with null or 0.
              autoPlayInterval: 7000,

              /// Loops back to first slide.
              isLoop: true,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Lô PQ2.3-02-01',
              style: TextStyle(
                color: secondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Icon(
                  Icons.location_on,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('Khu Thanh Long Vượng Tộc')
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: const [
                Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('Chủ sở hữu : Nguyễn Chính Hưng'),
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
            const CustomButtonTaisansoDetail(
                icon: Icons.book, title: 'Sổ hồng'),
            const SizedBox(
              height: 10,
            ),
            const CustomButtonTaisansoDetail(
                icon: Icons.article_rounded, title: 'Hợp đồng mua bán'),
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
          ]),
        ),
      ),
    );
  }
}