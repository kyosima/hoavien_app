import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/auth/forget_password_controller.dart';
import 'package:hoavien_app/controllers/auth/login_controller.dart';
import 'package:hoavien_app/controllers/auth/resetpasword_controller.dart';
import 'package:hoavien_app/controllers/customers/dashboard/dashboard_controller.dart';
import 'package:hoavien_app/controllers/customers/genealogy/add_genealogy_controller.dart';
import 'package:hoavien_app/controllers/customers/home/add_second_account_controller.dart';
import 'package:hoavien_app/controllers/customers/home/cart_controller.dart';
import 'package:hoavien_app/controllers/customers/home/home_controller.dart';
import 'package:hoavien_app/controllers/customers/home/search_controller.dart';
import 'package:hoavien_app/controllers/customers/home/taisanso_detail_controller.dart';
import 'package:hoavien_app/views/dashboard/dashboard_page.dart';
import 'package:hoavien_app/views/screens/auth/forgot_password_page.dart';
import 'package:hoavien_app/views/screens/auth/login_page.dart';
import 'package:hoavien_app/views/screens/auth/new_password.dart';
import 'package:hoavien_app/views/screens/auth/otp_page.dart';
import 'package:hoavien_app/views/screens/customers/event/event_page.dart';
import 'package:hoavien_app/views/screens/customers/genealogy/add_genealogy_page.dart';
import 'package:hoavien_app/views/screens/customers/genealogy/genealogy_page.dart';
import 'package:hoavien_app/views/screens/customers/home/add_second_account_page.dart';
import 'package:hoavien_app/views/screens/customers/home/cart_page.dart';
import 'package:hoavien_app/views/screens/customers/home/checkout_detail_page.dart';
import 'package:hoavien_app/views/screens/customers/home/checkout_page.dart';
import 'package:hoavien_app/views/screens/customers/home/combo_hot_detail_page.dart';
import 'package:hoavien_app/views/screens/customers/home/combo_hot_page.dart';
import 'package:hoavien_app/views/screens/customers/home/dichvu_antang_caitang_page.dart';
import 'package:hoavien_app/views/screens/customers/home/dichvu_thietke_xaydung_page.dart';
import 'package:hoavien_app/views/screens/customers/home/direct_map_page.dart';
import 'package:hoavien_app/views/screens/customers/home/home_page.dart';
import 'package:hoavien_app/views/screens/customers/home/notification_detail_page.dart';
import 'package:hoavien_app/views/screens/customers/home/notifications_page.dart';
import 'package:hoavien_app/views/screens/customers/home/product_detail_page.dart';
import 'package:hoavien_app/views/screens/customers/home/search_resuft_page.dart';
import 'package:hoavien_app/views/screens/customers/home/vatdung_thocung_page.dart';
import 'package:hoavien_app/views/screens/customers/home/pick_taisanso_page.dart';
import 'package:hoavien_app/views/screens/customers/home/qr_scan_page.dart';
import 'package:hoavien_app/views/screens/customers/home/second_account_page.dart';
import 'package:hoavien_app/views/screens/customers/home/taisanso_detail_page.dart';
import 'package:hoavien_app/views/screens/customers/home/taisanso_page.dart';
import 'package:hoavien_app/views/screens/customers/memories/list_user_page.dart';
import 'package:hoavien_app/views/screens/customers/memories/memories_page.dart';
import 'package:hoavien_app/views/screens/customers/user/user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          primaryColor: primaryColor,
        ),
        home: LoginPage(),
        initialBinding: LoginBinding(),
        getPages: [
          GetPage(
            name: '/login',
            page: () => LoginPage(),
            binding: LoginBinding(),
          ),
          GetPage(
            name: '/dashboard',
            page: () => DashboardPage(),
            binding: DashboardBindings(),
          ),
          GetPage(
            name: '/forgotpassword',
            page: () => const ForgotPassword(),
            binding: ForgetPasswordBinding(),
          ),
          GetPage(
            name: '/otp',
            page: () => const OtpPage(),
          ),
          GetPage(
            name: '/newpassword',
            page: () => NewPassword(),
            binding: ResetPasswordBinding(),
          ),
          GetPage(
            name: '/home',
            page: () => HomePage(),
            binding: HomeBinding(),
          ),
          GetPage(
            name: '/searchresuft',
            page: () => SearchResuftPage(),
            binding: SearchBindings(),
          ),
          GetPage(
            name: '/notification',
            page: () => NotificationsPage(),
          ),
          GetPage(
            name: '/notificationdetail',
            page: () => NotificationDetailPage(),
          ),
          GetPage(
            name: '/taisanso',
            page: () => TaiSanSoPage(),
          ),
          GetPage(
            name: '/taisansodetail',
            page: () => TaisansoDetailPage(),
            binding: TaisansoDetailBindings(),
          ),
          GetPage(
            name: '/sodochidan',
            page: () => DirectMapPage(),
          ),
          GetPage(
            name: '/qrscan',
            page: () => QrScanPage(),
          ),
          GetPage(
            name: '/checkout',
            page: () => CheckoutPage(),
          ),
          GetPage(
            name: '/checkoutdetail',
            page: () => CheckoutDetail(),
          ),
          GetPage(
            name: '/secondaccount',
            page: () => SecondAccount(),
          ),
          GetPage(
            name: '/addsecondaccount',
            page: () => AddSecondAccountPage(),
            binding: AddSecondAccountBinding(),
          ),
          GetPage(
            name: '/picktaisanso',
            page: () => PickTaisanso(),
          ),
          GetPage(
            name: '/combohot',
            page: () => ComboHotPage(),
          ),
          GetPage(
            name: '/combohotdetail',
            page: () => ComboHotDetailPage(),
          ),
          GetPage(
            name: '/productdetail',
            page: () => ProductDetailPage(),
          ),
          GetPage(
            name: '/cart',
            page: () => CartPage(),
            binding: CartBinding(),
          ),
          GetPage(
            name: '/dichvuantangcaitang',
            page: () => DichvuAntangCaiTangPage(),
          ),
          GetPage(
            name: '/dichvuthietkexaydung',
            page: () => DichvuThietkeXaydungPage(),
          ),
          GetPage(
            name: '/vatdungthocung',
            page: () => VatdungThocungPage(),
          ),
          GetPage(
            name: '/memories',
            page: () => MemoriesPage(),
          ),
          GetPage(
            name: '/giapha',
            page: () => GenealogyPage(),
          ),
          GetPage(
            name: '/sukien',
            page: () => EventPage(),
          ),
          GetPage(
            name: '/canhan',
            page: () => UserPage(),
          ),
          GetPage(
            name: '/danhsachthanhvien',
            page: () => ListUserPage(),
          ),
          GetPage(
            name: '/taogiapha',
            page: () => AddGenealogyPage(),
            binding: AddGenealogyBinding(),
          ),
        ]);
  }
}
