import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/domain/entity/user/user_entity.dart';
import 'package:neostore/presentation/shared/buttons/white_background_red_text_elevated_button.dart';
import 'package:neostore/presentation/shared/textfield/base_text_form_field.dart';
import 'package:neostore/presentation/user/controller/user_register_controller/user_register_events.dart';
import 'package:neostore/presentation/user/controller/user_register_controller/user_register_states.dart';
import 'package:neostore/presentation/user/controller/user_register_controller/user_register_bloc.dart';

import 'package:neostore/utils/constants.dart';
import 'package:neostore/utils/extensions/email_validator.dart';
import 'package:neostore/utils/extensions/phone_validator.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  Gender _selectedGender = Gender.male;
  bool _isChecked = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
        centerTitle: true,
        title: Text(
          "Register",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 230.h,
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
                BlocBuilder<UserRegistrationBloc, UserRegisterState>(
                    builder: (BuildContext context, UserRegisterState state) {
                  UserEntity userError = UserEntity();
                  if (state is InvalidUserRegisterInputState) {
                    userError = state.userRegisterError;
                  }
                  return Column(
                    children: [
                      BaseTextFormField(
                        controller: _firstNameController,
                        icon: Icons.person,
                        hintText: "First Name",
                        errorText: userError.firstName,
                        onChanged: (value) => _handleFormChange(context),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BaseTextFormField(
                        controller: _lastNameController,
                        icon: Icons.person,
                        hintText: "Last Name",
                        errorText: userError.lastName,
                        onChanged: (value) => _handleFormChange(context),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BaseTextFormField(
                        controller: _emailController,
                        icon: Icons.mail,
                        hintText: "Email",
                        errorText: userError.email,
                        onChanged: (value) => _handleFormChange(context),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BaseTextFormField(
                        controller: _passwordController,
                        icon: Icons.lock,
                        hintText: "Password",
                        obscureText: true,
                        errorText: userError.password,
                        onChanged: (value) => _handleFormChange(context),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BaseTextFormField(
                        controller: _confirmPasswordController,
                        icon: Icons.lock,
                        hintText: "Confirm Password",
                        obscureText: true,
                        errorText: userError.confirmPassword,
                        onChanged: (value) => _handleFormChange(context),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 0),
                        child: StatefulBuilder(builder: (context, setState) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Gender",
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              _buildGenderRadio(context, "Male", (value) {
                                setState(() {
                                  _selectedGender = value!;
                                });
                              }, Gender.male),
                              _buildGenderRadio(context, "Female", (value) {
                                setState(() {
                                  _selectedGender = value!;
                                });
                              }, Gender.female),
                            ],
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BaseTextFormField(
                        controller: _phoneController,
                        icon: Icons.phone_android,
                        hintText: "Phone Number",
                        textInputType: TextInputType.number,
                        errorText: userError.phoneNo,
                        onChanged: (value) => _handleFormChange(context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          StatefulBuilder(builder: (context, setState) {
                            return Checkbox(
                              value: _isChecked,
                              onChanged: (val) {
                                setState(() {
                                  _isChecked = !_isChecked;
                                });
                                _handleFormChange(context);
                              },
                              fillColor:
                                  MaterialStateProperty.all(Colors.white),
                            );
                          }),
                          Text(
                            "I agree the ",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Terms & Conditions ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                      decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                      WhiteBackgroundRedTextElevatedButton(
                        onPressed: () {
                          if (state is InitializeUserRegisterState ||
                              state is InvalidUserRegisterInputState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Please Fill the Form Details Correctly"),
                              ),
                            );

                            return;
                          }
                        },
                        text: "REGISTER",
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleFormChange(BuildContext context) {
    BlocProvider.of<UserRegistrationBloc>(context).add(
      RegisterInputChangeEvent(
        user: UserEntity(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          confirmPassword: _confirmPasswordController.text,
          phoneNo: _phoneController.text,
          acceptedTerms: _isChecked,
          gender: _selectedGender == Gender.male ? "M" : "F",
        ),
      ),
    );
  }

  Row _buildGenderRadio(
      BuildContext context, String text, Function onChanged, Gender value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Radio<Gender>(
            value: value,
            focusColor: Colors.white,
            fillColor: MaterialStateProperty.all(Colors.white),
            groupValue: _selectedGender,
            onChanged: (value) => onChanged(value)),
        Text(
          text,
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
    );
  }
}
