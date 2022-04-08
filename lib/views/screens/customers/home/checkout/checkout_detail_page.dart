import 'package:flutter/material.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class CheckoutDetail extends StatelessWidget {
  const CheckoutDetail({Key? key}) : super(key: key);

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
          title: 'Chi tiết lịch thanh toán',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.grey[300],
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Trạng thái',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Chờ thanh toán',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Ngày thanh toán dự kiến',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              '20/06/2022',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Lần thanh toán',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              'Đợt 2',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Tỷ lệ thanh toán',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              '30%',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Số tiền',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              '1.059.750.000',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Người thanh toán',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              'Nguyễn Chính Hưng',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Thông tin lô',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Mã lô',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              'PQ2.3-02-01',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Vị trí (khu)',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              'Phú Quý',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Hàng số',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              '2',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Vị trí số',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              '02',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Kích thước',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              '7.2 x 9',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Diện tích',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              '64.8 m2',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Chi phí chăm sóc',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              '27.000.000 đ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Kim tĩnh',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              '15.000.000 đ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Tổng giá tiền( 100%)',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              '2.879.000.000 đ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor,
                    ),
                    width: 250,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Liên hệ',
                        style: TextStyle(
                            color: secondaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
