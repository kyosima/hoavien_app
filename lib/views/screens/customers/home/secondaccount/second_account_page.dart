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
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        title: const CustomTitleText(
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
                    icon: const Icon(
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
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: controller.allSecondAccount.value?.length,
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
                                          const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/thanhvien.jpg'),
                                            radius: 25,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${controller.allSecondAccount.value![index].id} ${controller.allSecondAccount.value![index].phone} ',
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
                                                'Họ tên: ${controller.allSecondAccount.value![index].userInfo?.fullname}',
                                                style: const TextStyle(
                                                    color: secondaryColor,
                                                    fontSize: 14,
                                                    letterSpacing: 0),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                'Quan hệ: ${controller.allSecondAccount.value![index].userInfo?.relationship} ',
                                                style: const TextStyle(
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
                                            child: const Icon(
                                              Icons.delete,
                                              size: 20,
                                              color: Colors.red,
                                            ),
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                            title: const Text(
                                                                'Xóa tài khoản phụ?'),
                                                            content: const Text(
                                                                'Tài khoản phụ sẽ được xóa khỏi danh sách'),
                                                            actions: <Widget>[
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      child: Container(
                                                                          width: 120,
                                                                          decoration: BoxDecoration(color: Color(0xffFDF2D7), borderRadius: BorderRadius.circular(10)),
                                                                          child: const Padding(
                                                                            padding:
                                                                                EdgeInsets.all(10.0),
                                                                            child:
                                                                                Center(child: Text('Bỏ qua')),
                                                                          ))),
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        controller.deleteSecondAccout(
                                                                            id:
                                                                                '${controller.allSecondAccount.value![index].id}',
                                                                            addedby:
                                                                                '${user?.data?.id}');
                                                                        Get.back();
                                                                      },
                                                                      child: Container(
                                                                          width: 120,
                                                                          decoration: BoxDecoration(color: Colors.deepOrange, borderRadius: BorderRadius.circular(10)),
                                                                          child: const Padding(
                                                                            padding:
                                                                                EdgeInsets.all(10.0),
                                                                            child: Center(
                                                                                child: Text(
                                                                              'Đồng ý',
                                                                              style: TextStyle(color: Colors.white),
                                                                            )),
                                                                          ))),
                                                                ],
                                                              )
                                                            ],
                                                          ));
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
                                              Get.toNamed('/editsecondaccount',
                                                  arguments: controller
                                                      .allSecondAccount
                                                      .value![index]);
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
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
