import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/presentation/shared/buttons/white_background_red_text_elevated_button.dart';
import 'package:neostore/presentation/shared/textfield/base_text_form_field.dart';
import 'package:neostore/presentation/user/controller/forgot_password/forgot_password_bloc.dart';
import 'package:neostore/presentation/user/controller/forgot_password/forgot_password_event.dart';
import 'package:neostore/presentation/user/controller/forgot_password/forgot_password_state.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
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
        title: Text(
          "Forgot Password",
          style: Theme.of(context).textTheme.headline2,
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
                    BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                        builder:
                            (BuildContext context, ForgotPasswordState state) {
                      String? error;
                      if (state is InvalidInputForgotPasswordState) {
                        error = state.error;
                      }
                      return Column(
                        children: [
                          BaseTextFormField(
                            controller: _emailController,
                            errorText: error,
                            onChanged: (value) {
                              BlocProvider.of<ForgotPasswordBloc>(context).add(
                                  InputChangeForgotPasswordEvent(
                                      email: _emailController.text));
                            },
                            icon: Icons.email,
                            hintText: "Email",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          WhiteBackgroundRedTextElevatedButton(
                            onPressed: () {
                              if (state is InvalidInputForgotPasswordState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Invalid Email ")));
                                return;
                              }
                            },
                            text: "SEND PASSWORD",
                          ),
                        ],
                      );
                    }),
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
