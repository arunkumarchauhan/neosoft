import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/feature/shared/buttons/white_background_red_text_elevated_button.dart';
import 'package:neostore/feature/shared/buttons/white_text_button.dart';
import 'package:neostore/feature/shared/textfield/base_text_form_field.dart';
import 'package:neostore/utils/app_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40.w),
          height: ScreenUtil.defaultSize.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 450.h,
                  ),
                  Center(
                    child: Text(
                      "NeoSTORE",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  SizedBox(
                    height: 150.h,
                  ),
                  Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        BaseTextFormField(
                          icon: Icons.person,
                          hintText: "Username",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Valid Username";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        BaseTextFormField(
                          icon: Icons.lock,
                          hintText: "Password",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter The Password";
                            }
                            return null;
                          },
                        ),
                        WhiteBackgroundRedTextElevatedButton(
                          onPressed: () {
                            if (!_loginFormKey.currentState!.validate()) {
                              return;
                            }
                            //Perform Operation
                          },
                          text: "LOGIN",
                        ),
                        WhiteTextButton(
                          text: "Forgot Password?",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRouter.forgot_password);
                          },
                        ),
                        // SizedBox(
                        //   height: 100.h,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "DONT HAVE AN ACCOUNT",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.register);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.black.withOpacity(0.3),
                        height: 56,
                        width: 56,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 46,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
