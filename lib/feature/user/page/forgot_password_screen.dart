import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/feature/shared/buttons/white_background_red_text_elevated_button.dart';
import 'package:neostore/feature/shared/textfield/base_text_form_field.dart';
import 'package:neostore/utils/extensions/email_validator.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                      key: _forgotPasswordFormKey,
                      child: Column(
                        children: [
                          BaseTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email cannot be empty.";
                              }
                              if (!value.isValidEmail()) {
                                return "Please enter valid Email.";
                              }
                              return null;
                            },
                            icon: Icons.email,
                            hintText: "Email",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          WhiteBackgroundRedTextElevatedButton(
                            onPressed: () {
                              if (!_forgotPasswordFormKey.currentState!
                                  .validate()) {
                                return;
                              }
                            },
                            text: "SEND PASSWORD",
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
