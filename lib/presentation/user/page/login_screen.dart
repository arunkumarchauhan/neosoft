import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/domain/repositories/user_login_cred_entity.dart';
import 'package:neostore/presentation/shared/buttons/white_background_red_text_elevated_button.dart';
import 'package:neostore/presentation/shared/buttons/white_text_button.dart';
import 'package:neostore/presentation/shared/textfield/base_text_form_field.dart';
import 'package:neostore/presentation/user/controller/login_controller/login_bloc.dart';
import 'package:neostore/presentation/user/controller/login_controller/login_event.dart';
import 'package:neostore/presentation/user/controller/login_controller/login_state.dart';
import 'package:neostore/utils/app_router.dart';
import 'package:neostore/presentation/user/model/user_login_cred_error_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
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
                  BlocBuilder<LoginBloc, LoginState>(
                      builder: (BuildContext context, LoginState state) {
                    UserLoginCredError userLoginCredError =
                        UserLoginCredError();
                    if (state is InvalidLoginInputState) {
                      userLoginCredError = state.userLoginCredError;
                    }

                    debugPrint(state.toString());
                    return Column(
                      children: [
                        BaseTextFormField(
                          controller: _emailController,
                          icon: Icons.person,
                          textInputType: TextInputType.text,
                          hintText: "Email",
                          onChanged: (value) => _handleInputChange(context),
                          errorText: userLoginCredError.userNameError,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        BaseTextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          icon: Icons.lock,
                          hintText: "Password",
                          onChanged: (value) => _handleInputChange(context),
                          errorText: userLoginCredError.userPasswordError,
                        ),
                        WhiteBackgroundRedTextElevatedButton(
                          onPressed: () {
                            if (state is LoginInitialState ||
                                state is InvalidLoginInputState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Please Correct Invalid Inputs")));
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
                      ],
                    );
                  }),
                ],
              ),
              const SizedBox(
                height: 50,
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

  void _handleInputChange(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(LoginInputChangeEvent(
        userLoginCred: UserLoginCredEntity(
            email: _emailController.text, password: _passwordController.text)));
  }
}
