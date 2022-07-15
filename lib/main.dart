import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostore/presentation/cart/controller/cart_list_bloc.dart';
import 'package:neostore/presentation/my_order/controller/order_list/order_list_bloc.dart';
import 'package:neostore/presentation/product_detail/controller/product_detail_bloc.dart';
import 'package:neostore/presentation/product_listing/controller/product_listing_bloc.dart';
import 'package:neostore/presentation/user/controller/edit_profile/edit_profile_bloc.dart';
import 'package:neostore/presentation/user/controller/forgot_password/forgot_password_bloc.dart';
import 'package:neostore/presentation/user/controller/login_controller/login_bloc.dart';
import 'package:neostore/presentation/user/controller/reset_password/reset_password_bloc.dart';
import 'package:neostore/presentation/user/controller/user_register_controller/user_register_bloc.dart';
import 'package:neostore/presentation/address/pages/add_address_screen.dart';
import 'package:neostore/presentation/address/pages/address_list_page.dart';
import 'package:neostore/presentation/cart/pages/my_cart_page.dart';
import 'package:neostore/presentation/home/pages/home_screen.dart';
import 'package:neostore/presentation/my_order/controller/order_detail/order_detail_bloc.dart';
import 'package:neostore/presentation/my_order/pages/order_detail_page.dart';
import 'package:neostore/presentation/my_order/pages/order_list_page.dart';
import 'package:neostore/presentation/product_detail/pages/product_detail_page.dart';
import 'package:neostore/presentation/product_listing/pages/product_list_screen.dart';
import 'package:neostore/presentation/user/page/forgot_password_screen.dart';
import 'package:neostore/presentation/user/page/login_screen.dart';
import 'package:neostore/presentation/user/page/my_account_screen.dart';
import 'package:neostore/presentation/user/page/register_screen.dart';
import 'package:neostore/presentation/user/page/reset_password_screen.dart';
import 'package:neostore/utils/route_generator.dart';
import 'di/injection.dart' as di;
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
        BlocProvider<EditProfileBloc>(
          create: (BuildContext context) => di.locator<EditProfileBloc>(),
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
              initialRoute: AppRouter.home,
              onGenerateRoute: RouteGenerator.generateRoute,
            );
          }),
    );
  }
}
