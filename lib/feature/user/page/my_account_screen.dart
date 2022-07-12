import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/feature/shared/appbar/build_appbar_with_title_back_and_search_button.dart';
import 'package:neostore/feature/shared/buttons/white_background_red_text_elevated_button.dart';
import 'package:neostore/feature/shared/textfield/base_text_form_field.dart';
import 'package:neostore/utils/app_router.dart';

import 'package:neostore/utils/constants.dart';
import 'package:neostore/utils/date_formatter.dart';
import 'package:neostore/utils/extensions/email_validator.dart';
import 'package:neostore/utils/extensions/phone_validator.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final _editAccountFormKey = GlobalKey<FormState>();

  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final TextEditingController _phoneController;
  bool isEditing = false;
  String _dob = "DOB";
  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: buildAppbarWithTitleBackAndSearchButton(
          context: context, title: isEditing ? "EDIT PROFILE" : "My Account"),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 230.h,
                    ),
                    const Center(
                        child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(
                        "assets/images/profile.jpeg",
                      ),
                    )),
                    SizedBox(
                      height: 150.h,
                    ),
                    Form(
                      key: _editAccountFormKey,
                      child: Column(
                        children: [
                          BaseTextFormField(
                            enabled: false,
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
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () async {
                              final _selectedDOB = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime.now());

                              if (_selectedDOB != null) {
                                setState(() {
                                  _dob = formatDate(_selectedDOB);
                                });
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 40.w),
                              height: 180.h,
                              padding: EdgeInsets.all(30.w),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.cake,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 40.w,
                                  ),
                                  Text(
                                    _dob,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Gotham',
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (!isEditing)
                            WhiteBackgroundRedTextElevatedButton(
                              onPressed: () {
                                _emailController.clear();
                                _lastNameController.clear();
                                _emailController.clear();
                                _phoneController.clear();
                                isEditing = !isEditing;
                                _dob = "DOB";
                                setState(() {});
                                if (!_editAccountFormKey.currentState!
                                    .validate()) {
                                  return;
                                }
                              },
                              text: "EDIT PROFILE",
                            ),
                          if (isEditing)
                            WhiteBackgroundRedTextElevatedButton(
                              onPressed: () {
                                setState(() {});
                                if (!_editAccountFormKey.currentState!
                                    .validate()) {
                                  return;
                                }
                              },
                              text: "SUBMIT",
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              if (!isEditing)
                WhiteBackgroundRedTextElevatedButton(
                  text: "RESET PASSWORD",
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.reset_password);
                  },
                  marginEdgeInsects: const EdgeInsets.symmetric(horizontal: 0),
                )
            ],
          ),
        ),
      ),
    );
  }
}
