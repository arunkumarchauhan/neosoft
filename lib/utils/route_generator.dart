import 'package:flutter/material.dart';
import 'package:neostore/presentation/address/pages/add_address_screen.dart';
import 'package:neostore/presentation/address/pages/address_list_page.dart';
import 'package:neostore/presentation/cart/pages/my_cart_page.dart';
import 'package:neostore/presentation/home/pages/home_screen.dart';
import 'package:neostore/presentation/my_order/pages/order_detail_page.dart';
import 'package:neostore/presentation/my_order/pages/order_list_page.dart';
import 'package:neostore/presentation/product_detail/pages/product_detail_page.dart';
import 'package:neostore/presentation/product_listing/pages/product_list_screen.dart';
import 'package:neostore/presentation/user/page/forgot_password_screen.dart';
import 'package:neostore/presentation/user/page/login_screen.dart';
import 'package:neostore/presentation/user/page/my_account_screen.dart';
import 'package:neostore/presentation/user/page/register_screen.dart';
import 'package:neostore/presentation/user/page/reset_password_screen.dart';
import 'package:neostore/utils/app_router.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRouter.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRouter.register:
        return MaterialPageRoute(builder: (_) => Register());
      case AppRouter.forgot_password:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case AppRouter.reset_password:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case AppRouter.product_list:
        return MaterialPageRoute(builder: (_) => ProductListPage());
      case AppRouter.product_detail:
        return MaterialPageRoute(builder: (_) => ProductDetailPage());
      case AppRouter.my_orders:
        return MaterialPageRoute(builder: (_) => const MyOrdersListPage());
      case AppRouter.order_detail:
        return MaterialPageRoute(builder: (_) => const OrderDetailPage());
      case AppRouter.my_cart:
        return MaterialPageRoute(builder: (_) => MyCartPage());
      case AppRouter.add_address:
        return MaterialPageRoute(builder: (_) => AddAddressScreen());
      case AppRouter.list_address:
        return MaterialPageRoute(builder: (_) => const AddressListScreen());

      case AppRouter.my_account:
        return MaterialPageRoute(builder: (_) => MyAccount());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("ERROR"),
        ),
        body: const Center(
          child: Text("PAGE NOT FOUND"),
        ),
      );
    });
  }
}
