import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/auth/control_view_controller.dart';
import 'package:hoavien_app/controllers/auth/forget_password_controller.dart';
import 'package:hoavien_app/controllers/auth/auth_controller.dart';
import 'package:hoavien_app/controllers/auth/resetpasword_controller.dart';
import 'package:hoavien_app/controllers/customers/dashboard/dashboard_controller.dart';
import 'package:hoavien_app/controllers/customers/event/create_event_controller.dart';
import 'package:hoavien_app/controllers/customers/event/event_controller.dart';
import 'package:hoavien_app/controllers/customers/genealogy/add_genealogy_controller.dart';
import 'package:hoavien_app/controllers/customers/genealogy/genealogy_detail_controller.dart';
import 'package:hoavien_app/controllers/customers/home/product/product_detail_controller.dart';
import 'package:hoavien_app/controllers/customers/home/product/products_controller.dart';
import 'package:hoavien_app/controllers/customers/home/cart/cart_controller.dart';
import 'package:hoavien_app/controllers/customers/home/home_controller.dart';
import 'package:hoavien_app/controllers/customers/home/search_controller.dart';
import 'package:hoavien_app/controllers/customers/home/second_account/second_account_controller.dart';
import 'package:hoavien_app/controllers/customers/home/service/service_burial_detail_controller.dart';
import 'package:hoavien_app/controllers/customers/home/service/service_design_detail_controller.dart';
import 'package:hoavien_app/controllers/customers/home/taisanso/taisanso_controller.dart';
import 'package:hoavien_app/controllers/customers/home/taisanso/taisanso_detail_controller.dart';
import 'package:hoavien_app/controllers/customers/memories/memories_controller.dart';
import 'package:hoavien_app/controllers/customers/user/change_password_user_controller.dart';
import 'package:hoavien_app/controllers/saler/dashboard/saler_dashboard_controller.dart';
import 'package:hoavien_app/controllers/saler/home/bds_detail_controller.dart';
import 'package:hoavien_app/controllers/saler/home/saler_home_controller.dart';
import 'package:hoavien_app/controllers/saler/statistical/statistical_controller.dart';
import 'package:hoavien_app/controllers/saler/transaction/transaction_controller.dart';
import 'package:hoavien_app/controllers/saler/user/saler_user_controller.dart';
import 'package:hoavien_app/controllers/second_account/dashboard/secondaccount_dashboard_controller.dart';
import 'package:hoavien_app/controllers/second_account/home/product/second_account_product_controller.dart';
import 'package:hoavien_app/controllers/second_account/home/product/second_account_product_detail_controller.dart';
import 'package:hoavien_app/views/dashboard/customer/dashboard_customer_page.dart';
import 'package:hoavien_app/views/dashboard/saler/dashboard_saler_page.dart';
import 'package:hoavien_app/views/dashboard/second_accound/dashboard_secondaccount_page.dart';
import 'package:hoavien_app/views/screens/auth/control_view_page.dart';
import 'package:hoavien_app/views/screens/auth/forgot_password_page.dart';
import 'package:hoavien_app/views/screens/auth/login_page.dart';
import 'package:hoavien_app/views/screens/auth/new_password.dart';
import 'package:hoavien_app/views/screens/auth/otp_page.dart';
import 'package:hoavien_app/views/screens/customers/event/create_event_page.dart';
import 'package:hoavien_app/views/screens/customers/event/event_page.dart';
import 'package:hoavien_app/views/screens/customers/genealogy/add_genealogy_page.dart';
import 'package:hoavien_app/views/screens/customers/genealogy/genealogy_page.dart';
import 'package:hoavien_app/views/screens/customers/genealogy/genealory_detail_page.dart';
import 'package:hoavien_app/views/screens/customers/home/secondaccount/add_second_account_page.dart';
import 'package:hoavien_app/views/screens/customers/home/cart/cart_page.dart';
import 'package:hoavien_app/views/screens/customers/home/checkout/checkout_detail_page.dart';
import 'package:hoavien_app/views/screens/customers/home/checkout/checkout_page.dart';
import 'package:hoavien_app/views/screens/customers/home/secondaccount/edit_second_account_page.dart';
import 'package:hoavien_app/views/screens/customers/home/service/combo_hot_detail_page.dart';
import 'package:hoavien_app/views/screens/customers/home/service/combo_hot_page.dart';
import 'package:hoavien_app/views/screens/customers/home/service/service_burial_detail_page.dart';
import 'package:hoavien_app/views/screens/customers/home/service/service_burial_page.dart';
import 'package:hoavien_app/views/screens/customers/home/service/dichvu_thietke_xaydung_page.dart';
import 'package:hoavien_app/views/screens/customers/home/service/service_design_detail_page.dart';
import 'package:hoavien_app/views/screens/customers/home/service/service_design_page.dart';
import 'package:hoavien_app/views/screens/customers/home/taisanso/direct_map_page.dart';
import 'package:hoavien_app/views/screens/customers/home/home_page.dart';
import 'package:hoavien_app/views/screens/customers/home/notification/notification_detail_page.dart';
import 'package:hoavien_app/views/screens/customers/home/notification/notifications_page.dart';
import 'package:hoavien_app/views/screens/customers/home/product/product_detail_page.dart';
import 'package:hoavien_app/views/screens/customers/home/search_resuft_page.dart';
import 'package:hoavien_app/views/screens/customers/home/product/products_page.dart';
import 'package:hoavien_app/views/screens/customers/home/secondaccount/pick_taisanso_page.dart';
import 'package:hoavien_app/views/screens/customers/home/qr/qr_scan_page.dart';
import 'package:hoavien_app/views/screens/customers/home/secondaccount/second_account_page.dart';
import 'package:hoavien_app/views/screens/customers/home/taisanso/taisanso_detail_page.dart';
import 'package:hoavien_app/views/screens/customers/home/taisanso/taisanso_page.dart';
import 'package:hoavien_app/views/screens/customers/memories/image_detail_page.dart';
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
import 'package:hoavien_app/views/screens/saler/statistical/total_detail_page.dart';
import 'package:hoavien_app/views/screens/saler/transaction/transaction_detail_page.dart';
import 'package:hoavien_app/views/screens/saler/transaction/transaction_page.dart';
import 'package:hoavien_app/views/screens/saler/user/change_password_saler_page.dart';
import 'package:hoavien_app/views/screens/saler/user/info_user_saler_page.dart';
import 'package:hoavien_app/views/screens/saler/user/user_page.dart';
import 'package:hoavien_app/views/screens/second_account/home/product/second_account_product_detail_page.dart';
import 'package:hoavien_app/views/screens/second_account/home/product/second_account_product_page.dart';
import 'package:hoavien_app/views/screens/second_account/user/change_second_account_password_page.dart';
import 'package:hoavien_app/views/screens/second_account/user/info_second_account_page.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'controllers/second_account/dashboard/secondaccount_dashboard_controller.dart';

void main() async {
  await initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

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
        home: ControlView(),
        initialBinding: ControlViewBinding(),
        getPages: [
          //Customer
          GetPage(
            name: '/login',
            page: () => LoginPage(),
            binding: AuthBinding(),
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
            page: () => const NewPassword(),
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
            page: () => const NotificationsPage(),
          ),
          GetPage(
            name: '/notificationdetail',
            page: () => const NotificationDetailPage(),
          ),
          GetPage(
            name: '/taisanso',
            page: () => TaiSanSoPage(),
            binding: TaisansoBinding(),
          ),
          GetPage(
            name: '/taisansodetail',
            page: () => const TaisansoDetailPage(),
            binding: TaisansoDetailBindings(),
          ),
          GetPage(
            name: '/sodochidan',
            page: () => const DirectMapPage(),
          ),
          GetPage(
            name: '/qrscan',
            page: () => const QrScanPage(),
          ),
          GetPage(
            name: '/checkout',
            page: () => const CheckoutPage(),
          ),
          GetPage(
            name: '/checkoutdetail',
            page: () => const CheckoutDetail(),
          ),
          GetPage(
            name: '/secondaccount',
            page: () => SecondAccount(),
            binding: SecondAccountBinding(),
          ),
          GetPage(
            name: '/editsecondaccount',
            page: () => EditSecondAccountPage(),
          ),
          GetPage(
            name: '/addsecondaccount',
            page: () => AddSecondAccountPage(),
          ),
          GetPage(
            name: '/picktaisanso',
            page: () => const PickTaisanso(),
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
            binding: ProductDetailBinding(),
          ),
          GetPage(
            name: '/cart',
            page: () => const CartPage(),
            binding: CartBinding(),
          ),
          GetPage(
            name: '/serviceburial',
            page: () => ServiceBurial(),
          ),
          GetPage(
            name: '/servicedesign',
            page: () => ServiceDesignPage(),
          ),
          GetPage(
            name: '/serviceburialdetail',
            page: () => ServiceBurialDetailPage(),
            binding: ServiceBurialDetailBinding(),
          ),
          GetPage(
            name: '/servicedesigndetail',
            page: () => ServiceDesignDetailPage(),
            binding: ServiceDesignDetailBinding(),
          ),
          GetPage(
            name: '/dichvuthietkexaydung',
            page: () => const DichvuThietkeXaydungPage(),
          ),
          GetPage(
            name: '/product',
            page: () => ProductPage(),
            binding: ProductsBinding(),
          ),
          GetPage(
            name: '/memories',
            page: () => MemoriesPage(),
            binding: MemoriesBindings(),
          ),
          GetPage(
            name: '/imagedetail',
            page: () => ImageDetailPage(),
          ),
          GetPage(
            name: '/giapha',
            page: () => const GenealogyPage(),
          ),
          GetPage(
            name: '/chitietgiapha',
            page: () => GenealoryDetailPage(),
            binding: GenealoryDetailBindings(),
          ),
          GetPage(
            name: '/sukien',
            page: () => EventPage(),
            binding: EventBinding(),
          ),
          GetPage(
            name: '/canhan',
            page: () => UserPage(),
          ),
          GetPage(
            name: '/danhsachthanhvien',
            page: () => const ListUserPage(),
          ),
          GetPage(
            name: '/taogiapha',
            page: () => const AddGenealogyPage(),
            binding: AddGenealogyBinding(),
          ),
          GetPage(
            name: '/taosukien',
            page: () => const CreateEventPage(),
            binding: CreateEventBindings(),
          ),
          GetPage(
            name: '/thongtincanhan',
            page: () => InfoUserPage(),
          ),
          GetPage(
            name: '/lichsumuahang',
            page: () => const CartHistoryPage(),
          ),
          GetPage(
            name: '/donhangchoxacnhan',
            page: () => const CartHistoryDetailWaittingPage(),
          ),
          GetPage(
            name: '/donhangdahoanthanh',
            page: () => const CartHistoryDetailDonePage(),
          ),
          GetPage(
            name: '/danhgiasanpham',
            page: () => const RateProductPage(),
          ),
          GetPage(
            name: '/donhangdahuy',
            page: () => const CartHistoryDetailCancelPage(),
          ),
          GetPage(
            name: '/thaydoimatkhau',
            page: () => ChangePasswordPage(),
            binding: ChangePasswordUserBinding(),
          ),
          GetPage(
            name: '/gioithieu',
            page: () => const AboutPage(),
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
            page: () => SalerDashboardPage(),
            binding: SalerDashboardBinding(),
          ),
          GetPage(
            name: '/giaodich',
            page: () => const TransactionPage(),
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
            name: '/infousersaler',
            page: () => SalerInfoPage(),
          ),
          GetPage(
            name: '/changepasswordsaler',
            page: () => SalerChangePasswordPage(),
          ),
          GetPage(
            name: '/thongbaosaler',
            page: () => const SalerNotificationsPage(),
          ),
          GetPage(
            name: '/chitietbatdongsan',
            page: () => BdsDetailPage(),
            binding: BdsDetailsBinding(),
          ),
          GetPage(
            name: '/chitietgiaodich',
            page: () => const TransactionDetailPage(),
          ),
          GetPage(
            name: '/tongdoanhthu',
            page: () => const TotalDetailPage(),
          ),
          //secondaccountpage
          //secondaccountpage
          //secondaccountpage
          GetPage(
            name: '/secondaccountdashboard',
            page: () => SecondAccountDashboardPage(),
            binding: SecondAccountDashboardBinding(),
          ),
          GetPage(
            name: '/infosecondaccount',
            page: () => InfoSecondAccount(),
          ),
          GetPage(
            name: '/changesecondaccountpassword',
            page: () => ChangeSecondAccoutPassword(),
          ),
          GetPage(
            name: '/secondaccountproduct',
            page: () => SecondAccountProductPage(),
            binding: SecondAccountProductsBinding(),
          ),
          GetPage(
            name: '/secondaccountproductdetail',
            page: () => SecondAccountProductDetailPage(),
            binding: SecondAccountProductDetailBinding(),
          ),
        ]);
  }
}
