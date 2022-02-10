import 'package:flutter/material.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTitleText(
          title: 'Giới thiệu ứng dụng',
        ),
        centerTitle: false,
        iconTheme: IconThemeData(
          color: secondaryColor,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Text(
            '''Công ty TNHH Hoa Viên Bình An được thành lập từ tháng 01/2016 với ngành nghề kinh doanh chính là dịch vụ nghĩa trang cao cấp. Công viên nghĩa trang Hoa Viên Bình An là dự án đầu tiên của Công ty TNHH Hoa Viên Bình An làm chủ đầu tư với tổng số vốn đầu tư dự kiến lên tới hơn 1.000 tỉ đồng.

Với tôn chỉ hoạt động “coi người thân của khách hàng như người thân của mình”, Hoa Viên Binh An cam kết sẽ trở thành Công viên nghĩa trang có dịch vụ tiện ích và đẳng cấp nhất Việt Nam.

Trong suốt quá trình hoạt động, bằng cách làm việc chuyên nghiệp, chính xác, tận tình, luôn hỗ trợ hết mình cho khách hàng, đội ngũ chuyên viên tư vấn của Hoa Viên Bình An luôn luôn làm hài lòng các khách hàng dù là khó tính nhất khi mua sản phẩm của Hoa Viên Bình An.

Hoa Viên Bình An xin chân thành cảm ơn Quý khách hàng đã tin tưởng mua sản phẩm và sử dụng dịch vụ của Công ty. Chúng tôi sẽ không ngừng nâng cao chất lượng dịch vụ để đáp lại niềm tin và sự chọn lựa của Quý khách hàng.''',
            style: TextStyle(fontSize: 15, letterSpacing: 1, wordSpacing: 2),
          ),
        ),
      ),
    );
  }
}
