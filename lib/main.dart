import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/auth/forget_password_controller.dart';
import 'package:hoavien_app/controllers/auth/login_controller.dart';
import 'package:hoavien_app/controllers/auth/resetpasword_controller.dart';
import 'package:hoavien_app/controllers/customers/dashboard/dashboard_controller.dart';
import 'package:hoavien_app/controllers/customers/event/create_event_controller.dart';
import 'package:hoavien_app/controllers/customers/genealogy/add_genealogy_controller.dart';
import 'package:hoavien_app/controllers/customers/home/add_second_account_controller.dart';
import 'package:hoavien_app/controllers/customers/home/cart_controller.dart';
import 'package:hoavien_app/controllers/customers/home/home_controller.dart';
import 'package:hoavien_app/controllers/customers/home/search_controller.dart';
import 'package:hoavien_app/controllers/customers/home/taisanso_detail_controller.dart';
import 'package:hoavien_app/controllers/customers/user/change_password_user_controller.dart';
import 'package:hoavien_app/controllers/customers/user/info_user_controller.dart';
import 'package:hoavien_app/controllers/saler/dashboard/saler_dashboard_controller.dart';
import 'package:hoavien_app/controllers/saler/home/bds_detail_controller.dart';
import 'package:hoavien_app/controllers/saler/home/saler_home_controller.dart';
import 'package:hoavien_app/controllers/saler/statistical/statistical_controller.dart';
import 'package:hoavien_app/controllers/saler/transaction/transaction_controller.dart';
import 'package:hoavien_app/controllers/saler/user/saler_user_controller.dart';
import 'package:hoavien_app/views/dashboard/dashboard_customer_page.dart';
import 'package:hoavien_app/views/dashboard/dashboard_saler_page.dart';
import 'package:hoavien_app/views/screens/auth/forgot_password_page.dart';
import 'package:hoavien_app/views/screens/auth/login_page.dart';
import 'package:hoavien_app/views/screens/auth/new_password.dart';
import 'package:hoavien_app/views/screens/auth/otp_page.dart';
import 'package:hoavien_app/views/screens/customers/event/create_event_page.dart';
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
import 'package:hoavien_app/views/screens/customers/user/about_page.dart';
import 'package:hoavien_app/views/screens/customers/user/cart_history_detail_cancel_page.dart';
import 'package:hoavien_app/views/screens/customers/user/cart_history_detail_done_page.dart';
import 'package:hoavien_app/views/screens/customers/user/cart_history_detail_waiting_page.dart';
import 'package:hoavien_app/views/screens/customers/user/cart_history_page.dart';
import 'package:hoavien_app/views/screens/customers/user/change_password_page.dart';
import 'package:hoavien_app/views/screens/customers/user/info_user_page.dart';
import 'package:hoavien_app/views/screens/customers/user/rate_product_page.dart';
import 'package:hoavien_app/views/screens/customers/user/user_page.dart';
import 'package:hoavien_app/views/screens/saler/home/bds_detail_page.dart';
import 'package:hoavien_app/views/screens/saler/home/home_page.dart';
import 'package:hoavien_app/views/screens/saler/home/notifications_page.dart';
import 'package:hoavien_app/views/screens/saler/statistical/statistical_page.dart';
import 'package:hoavien_app/views/screens/saler/transaction/transaction_detail_page.dart';
import 'package:hoavien_app/views/screens/saler/transaction/transaction_page.dart';
import 'package:hoavien_app/views/screens/saler/user_page.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          primaryColor: primaryColor,
        ),
        home: LoginPage(),
        initialBinding: LoginBinding(),
        getPages: [
          //Customer
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
          GetPage(
            name: '/taosukien',
            page: () => CreateEventPage(),
            binding: CreateEventBindings(),
          ),
          GetPage(
            name: '/thongtincanhan',
            page: () => InfoUserPage(),
            binding: InfoUserBinding(),
          ),
          GetPage(
            name: '/lichsumuahang',
            page: () => CartHistoryPage(),
          ),
          GetPage(
            name: '/donhangchoxacnhan',
            page: () => CartHistoryDetailWaittingPage(),
          ),
          GetPage(
            name: '/donhangdahoanthanh',
            page: () => CartHistoryDetailDonePage(),
          ),
          GetPage(
            name: '/danhgiasanpham',
            page: () => RateProductPage(),
          ),
          GetPage(
            name: '/donhangdahuy',
            page: () => CartHistoryDetailCancelPage(),
          ),
          GetPage(
            name: '/thaydoimatkhau',
            page: () => ChangePasswordPage(),
            binding: ChangePasswordUserBinding(),
          ),
          GetPage(
            name: '/gioithieu',
            page: () => AboutPage(),
          ),
          // Saler
          // Saler
          // Saler
          // Saler
          // Saler
          // Saler
          GetPage(
            name: '/homesaler',
            page: () => SalerHomePage(),
            binding: SalerHomeBinding(),
          ),
          GetPage(
            name: '/salerdashboard',
            page: () => DashboardSalerPage(),
            binding: SalerDashboardBinding(),
          ),
          GetPage(
            name: '/giaodich',
            page: () => TransactionPage(),
            binding: TransactionBinding(),
          ),
          GetPage(
            name: '/thongke',
            page: () => StatisticalPage(),
            binding: StatisticalBinding(),
          ),
          GetPage(
            name: '/usersaler',
            page: () => SalerUserPage(),
            binding: SalerUserBinding(),
          ),
          GetPage(
            name: '/thongbaosaler',
            page: () => SalerNotificationsPage(),
          ),
          GetPage(
            name: '/chitietbatdongsan',
            page: () => BdsDetailPage(),
            binding: BdsDetailsBinding(),
          ),
          GetPage(
            name: '/chitietgiaodich',
            page: () => TransactionDetailPage(),
          ),
        ]);
  }
}
