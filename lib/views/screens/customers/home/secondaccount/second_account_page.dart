import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/second_account/second_account_controller.dart';
import 'package:hoavien_app/models/auth/user_model.dart';
import 'package:hoavien_app/views/screens/customers/home/secondaccount/add_second_account_page.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:hoavien_app/views/widgets/customsearch.dart';

class SecondAccount extends StatelessWidget {
  SecondAccountController controller = Get.put(SecondAccountController());
  UserModel? user;
  SecondAccount({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: secondaryColor,
        ),
        title: CustomTitleText(
          title: 'Tài khoản phụ ',
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomSearch(
                      onChanged: (value) {
                        controller.findSecondAccount(value);
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: secondaryColor,
                      size: 40,
                    ),
                    onPressed: () {
                      Get.to(() => AddSecondAccountPage(user: user));
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GetBuilder<SecondAccountController>(builder: (_) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: controller.foundSecondAccount.value.length,
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/thanhvien.jpg'),
                                          radius: 25,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.foundSecondAccount
                                                  .value[index]['phoneNumber'],
                                              style: TextStyle(
                                                color: secondaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              'Họ tên: ${controller.foundSecondAccount.value[index]['name']}',
                                              style: TextStyle(
                                                color: secondaryColor,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              'Quan hệ: ${controller.foundSecondAccount.value[index]['relationship']}',
                                              style: TextStyle(
                                                color: secondaryColor,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          child: Icon(
                                            Icons.delete,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                          onTap: () {
                                            print('edit');
                                          },
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                          child: Icon(
                                            Icons.edit,
                                            size: 20,
                                            color: colorText,
                                          ),
                                          onTap: () {
                                            print('edit');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
