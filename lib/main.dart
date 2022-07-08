import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostore/feature/home/pages/home_screen.dart';
import 'package:neostore/feature/product_detail/controller/product_detail_bloc.dart';
import 'package:neostore/feature/product_detail/pages/product_detail_page.dart';
import 'package:neostore/feature/product_listing/controller/product_listing_bloc.dart';
import 'package:neostore/feature/product_listing/pages/product_list_screen.dart';
import 'package:neostore/feature/user/page/forgot_password_screen.dart';
import 'package:neostore/feature/user/page/login_screen.dart';
import 'package:neostore/feature/user/page/register_screen.dart';
import 'package:neostore/feature/user/page/reset_password.dart';
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
        BlocProvider<ProductListingBloc>(
          create: (BuildContext context) => di.locator<ProductListingBloc>(),
        ),
        BlocProvider<ProductDetailBloc>(
          create: (BuildContext context) => di.locator<ProductDetailBloc>(),
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
              routes: {
                AppRouter.login: (_) => const LoginScreen(),
                AppRouter.register: (_) => const Register(),
                AppRouter.forgot_password: (_) => const ForgotPasswordScreen(),
                AppRouter.home: (_) => const HomeScreen(),
                AppRouter.reset_password: (_) => const ResetPasswordScreen(),
                AppRouter.product_list: (_) => ProductListPage(),
                AppRouter.product_detail: (_) => const ProductDetailPage(),
              },
            );
          }),
    );
  }
}
