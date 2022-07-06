import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/feature/shared/buttons/white_background_red_text_elevated_button.dart';
import 'package:neostore/feature/shared/textfield/base_text_form_field.dart';
import 'package:neostore/utils/extensions/email_validator.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _resetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset Password",
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        elevation: 0.8,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40.w),
          height: ScreenUtil.defaultSize.height,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250.h,
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
                      key: _resetPasswordFormKey,
                      child: Column(
                        children: [
                          BaseTextFormField(
                            controller: _currentPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This Field Cannot be empty";
                              }

                              return null;
                            },
                            icon: Icons.lock,
                            hintText: "Current Password",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BaseTextFormField(
                            controller: _passwordController,
                            icon: Icons.lock,
                            hintText: "New Password",
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This Field Cannot be empty";
                              }
                              if (_passwordController.text !=
                                  _confirmPasswordController.text) {
                                return "Confirm Password and passwords are not same.";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BaseTextFormField(
                            controller: _confirmPasswordController,
                            icon: Icons.lock,
                            hintText: "Confirm Password",
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This Field Cannot be empty";
                              }
                              if (_passwordController.text !=
                                  _confirmPasswordController.text) {
                                return "Confirm Password and passwords are not same.";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          WhiteBackgroundRedTextElevatedButton(
                            onPressed: () {
                              if (!_resetPasswordFormKey.currentState!
                                  .validate()) {
                                return;
                              }
                            },
                            text: "RESET PASSWORD",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
