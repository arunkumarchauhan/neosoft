import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/domain/entity/user/reset_password_body_entity.dart';
import 'package:neostore/presentation/shared/buttons/white_background_red_text_elevated_button.dart';
import 'package:neostore/presentation/shared/textfield/base_text_form_field.dart';
import 'package:neostore/presentation/user/controller/reset_password/reset_password_bloc.dart';
import 'package:neostore/presentation/user/controller/reset_password/reset_password_event.dart';
import 'package:neostore/presentation/user/controller/reset_password/reset_password_state.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _resetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
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
            child: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                builder: (BuildContext context, ResetPasswordState state) {
              ResetPasswordBodyEntity errorBody = ResetPasswordBodyEntity();
              if (state is InvalidInputResetPasswordState) {
                errorBody = state.passwordBodyEntity;
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  BaseTextFormField(
                    controller: _currentPasswordController,
                    errorText: errorBody.oldPassword,
                    onChanged: (value) => _handleFormChange(context),
                    icon: Icons.lock,
                    hintText: "Current Password",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BaseTextFormField(
                    controller: _newPasswordController,
                    icon: Icons.lock,
                    hintText: "New Password",
                    obscureText: true,
                    onChanged: (value) => _handleFormChange(context),
                    errorText: errorBody.password,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BaseTextFormField(
                    controller: _confirmPasswordController,
                    icon: Icons.lock,
                    hintText: "Confirm Password",
                    obscureText: true,
                    errorText: errorBody.confirmPassword,
                    onChanged: (value) => _handleFormChange(context),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  WhiteBackgroundRedTextElevatedButton(
                    onPressed: () {
                      if (state is InvalidInputResetPasswordState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill the form correctly"),
                          ),
                        );
                        return;
                      }
                    },
                    text: "RESET PASSWORD",
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  void _handleFormChange(BuildContext context) {
    context.read<ResetPasswordBloc>().add(
          InputChangeResetPasswordEvent(
            passwordBodyEntity: ResetPasswordBodyEntity(
                oldPassword: _currentPasswordController.text,
                password: _newPasswordController.text,
                confirmPassword: _confirmPasswordController.text),
          ),
        );
  }
}
