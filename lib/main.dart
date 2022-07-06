import 'package:flutter/material.dart';
import 'package:neostore/feature/home/pages/home_screen.dart';
import 'package:neostore/feature/user/page/forgot_password_screen.dart';
import 'package:neostore/feature/user/page/login_screen.dart';
import 'package:neostore/feature/user/page/register_screen.dart';

import 'package:neostore/utils/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1080, 1920),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch:
                  MaterialColor(HexColor.fromHex("#bb0100").value, swatchColor),
              textTheme: const TextTheme(
                  headline1: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 45,
                    fontFamily: 'Gotham',
                  ),
                  headline2: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Gotham',
                    fontSize: 18,
                  ),
                  headline3: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Gotham',
                    fontSize: 23,
                  )),
              iconTheme: const IconThemeData(
                color: Colors.white,
                size: 25,
                opacity: 1,
              ),
              inputDecorationTheme: const InputDecorationTheme(
                iconColor: Colors.white,
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Gotham',
                  fontSize: 18,
                ),
                errorStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  alignment: Alignment.center,
                  textStyle: MaterialStateProperty.all(
                    TextStyle(
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.w500,
                      fontSize: 26,
                      color: HexColor.fromHex("#E91C1A"),
                    ),
                  ),
                ),
              ),
            ),
            initialRoute: AppRouter.login,
            routes: {
              AppRouter.login: (_) => const LoginScreen(),
              AppRouter.register: (_) => const Register(),
              AppRouter.forgot_password: (_) => const ForgotPasswordScreen(),
              AppRouter.home: (_) => const HomeScreen(),
            },
          );
        });
  }
}
