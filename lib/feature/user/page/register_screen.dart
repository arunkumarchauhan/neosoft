import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/feature/shared/buttons/white_background_red_text_elevated_button.dart';
import 'package:neostore/feature/shared/textfield/base_text_form_field.dart';

import 'package:neostore/utils/constants.dart';
import 'package:neostore/utils/extensions/email_validator.dart';
import 'package:neostore/utils/extensions/phone_validator.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Gender _selectedGender = Gender.male;
  bool _isChecked = false;
  final _registerFormKey = GlobalKey<FormState>();

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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                    Form(
                      key: _registerFormKey,
                      child: Column(
                        children: [
                          BaseTextFormField(
                            controller: _firstNameController,
                            icon: Icons.person,
                            hintText: "First Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This Field Cannot be empty";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BaseTextFormField(
                            controller: _lastNameController,
                            icon: Icons.person,
                            hintText: "Last Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This Field Cannot be empty";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BaseTextFormField(
                            controller: _emailController,
                            icon: Icons.mail,
                            hintText: "Email",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This Field Cannot be empty";
                              }
                              if (!value.isValidEmail()) {
                                return "Invalid Email";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BaseTextFormField(
                            controller: _passwordController,
                            icon: Icons.lock,
                            hintText: "Password",
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
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 0),
                            child: Row(
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
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BaseTextFormField(
                            controller: _passwordController,
                            icon: Icons.phone_android,
                            hintText: "Phone Number",
                            textInputType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This Field Cannot be empty";
                              }
                              if (!value.isValidPhone()) {
                                return "Invalid Phone Number";
                              }
                              return null;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: _isChecked,
                                onChanged: (val) {
                                  setState(() {
                                    _isChecked = !_isChecked;
                                  });
                                },
                                fillColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
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
                              if (!_registerFormKey.currentState!.validate() ||
                                  _isChecked == false) {
                                if (!_isChecked) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Please Accept Terms And Conditions"),
                                    ),
                                  );
                                }
                                return;
                              }
                            },
                            text: "REGISTER",
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
