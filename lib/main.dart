import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostore/feature/address/pages/add_address_screen.dart';
import 'package:neostore/feature/address/pages/address_list_page.dart';
import 'package:neostore/feature/cart/controller/cart_list_bloc.dart';
import 'package:neostore/feature/cart/pages/my_cart_page.dart';
import 'package:neostore/feature/home/pages/home_screen.dart';
import 'package:neostore/feature/my_order/controller/order_detail/order_detail_bloc.dart';
import 'package:neostore/feature/my_order/controller/order_list/order_list_bloc.dart';
import 'package:neostore/feature/my_order/pages/order_detail_page.dart';
import 'package:neostore/feature/my_order/pages/order_list_page.dart';
import 'package:neostore/feature/product_detail/controller/product_detail_bloc.dart';
import 'package:neostore/feature/product_detail/pages/product_detail_page.dart';
import 'package:neostore/feature/product_listing/controller/product_listing_bloc.dart';
import 'package:neostore/feature/product_listing/pages/product_list_screen.dart';
import 'package:neostore/feature/user/controller/forgot_password/forgot_password_bloc.dart';
import 'package:neostore/feature/user/controller/login_controller/login_bloc.dart';
import 'package:neostore/feature/user/controller/reset_password/reset_password_bloc.dart';
import 'package:neostore/feature/user/controller/user_register_controller/user_register_bloc.dart';
import 'package:neostore/feature/user/page/forgot_password_screen.dart';
import 'package:neostore/feature/user/page/login_screen.dart';
import 'package:neostore/feature/user/page/my_account_screen.dart';
import 'package:neostore/feature/user/page/register_screen.dart';
import 'package:neostore/feature/user/page/reset_password_screen.dart';
import './core/injection.dart' as di;
import 'package:neostore/utils/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/utils/theme_data.dart';

void main() {
  di.inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => di.locator<LoginBloc>(),
        ),
        BlocProvider<UserRegistrationBloc>(
          create: (BuildContext context) => di.locator<UserRegistrationBloc>(),
        ),
        BlocProvider<ForgotPasswordBloc>(
          create: (BuildContext context) => di.locator<ForgotPasswordBloc>(),
        ),
        BlocProvider<ResetPasswordBloc>(
          create: (BuildContext context) => di.locator<ResetPasswordBloc>(),
        ),
        BlocProvider<ProductListingBloc>(
          create: (BuildContext context) => di.locator<ProductListingBloc>(),
        ),
        BlocProvider<ProductDetailBloc>(
          create: (BuildContext context) => di.locator<ProductDetailBloc>(),
        ),
        BlocProvider<OrderListingBloc>(
          create: (BuildContext context) => di.locator<OrderListingBloc>(),
        ),
        BlocProvider<OrderDetailBloc>(
          create: (BuildContext context) => di.locator<OrderDetailBloc>(),
        ),
        BlocProvider<CartListBloc>(
          create: (BuildContext context) => di.locator<CartListBloc>(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(1080, 1920),
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: buildThemeData(),
              initialRoute: AppRouter.reset_password,
              routes: {
                AppRouter.login: (_) => LoginScreen(),
                AppRouter.register: (_) => Register(),
                AppRouter.forgot_password: (_) => ForgotPasswordScreen(),
                AppRouter.home: (_) => const HomeScreen(),
                AppRouter.reset_password: (_) => const ResetPasswordScreen(),
                AppRouter.product_list: (_) => ProductListPage(),
                AppRouter.product_detail: (_) => ProductDetailPage(),
                AppRouter.my_orders: (_) => const MyOrdersListPage(),
                AppRouter.order_detail: (_) => const OrderDetailPage(),
                AppRouter.my_cart: (_) => MyCartPage(),
                AppRouter.add_address: (_) => AddAddressScreen(),
                AppRouter.list_address: (_) => AddressListScreen(),
                AppRouter.my_account: (_) => MyAccount(),
              },
            );
          }),
    );
  }
}
