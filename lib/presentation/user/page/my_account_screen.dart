import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/domain/entity/user/edit_profile_body_entity.dart';
import 'package:neostore/presentation/shared/appbar/build_appbar_with_title_back_and_search_button.dart';
import 'package:neostore/presentation/shared/buttons/white_background_red_text_elevated_button.dart';
import 'package:neostore/presentation/shared/textfield/base_text_form_field.dart';
import 'package:neostore/presentation/user/controller/edit_profile/edit_profile_bloc.dart';
import 'package:neostore/presentation/user/controller/edit_profile/edit_profile_event.dart';
import 'package:neostore/presentation/user/controller/edit_profile/edit_profile_states.dart';
import 'package:neostore/utils/app_router.dart';
import 'package:neostore/utils/constants.dart';

import 'package:neostore/utils/date_formatter.dart';
import 'package:neostore/utils/extensions/email_validator.dart';
import 'package:neostore/utils/extensions/phone_validator.dart';

class MyAccount extends StatelessWidget {
  MyAccount({Key? key}) : super(key: key);

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();
  bool isEditing = false;
  String _dob = kDob;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: buildAppbarWithTitleBackAndSearchButton(
          context: context, title: isEditing ? "EDIT PROFILE" : "My Account"),
      body: SingleChildScrollView(
        child: Center(
          child: BlocBuilder<EditProfileBloc, EditProfileState>(
              builder: (BuildContext context, EditProfileState state) {
            EditProfileBodyEntity errorBody = EditProfileBodyEntity();
            if (isEditing && state is InvalidInputEditProfileState) {
              errorBody = state.errorBody;
            }
            if (state is EditButtonClickedEditProfileState) {
              isEditing = true;
            }
            return Column(
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
                      const SizedBox(
                        height: 55,
                      ),
                      Column(
                        children: [
                          BaseTextFormField(
                            enabled: isEditing,
                            controller: _firstNameController,
                            icon: Icons.person,
                            hintText: "First Name",
                            errorText: errorBody.firstName,
                            onChanged: (value) => _handleFormChange(context),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BaseTextFormField(
                            enabled: isEditing,
                            controller: _lastNameController,
                            icon: Icons.person,
                            hintText: "Last Name",
                            errorText: errorBody.lastName,
                            onChanged: (value) => _handleFormChange(context),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BaseTextFormField(
                            controller: _emailController,
                            icon: Icons.mail,
                            enabled: isEditing,
                            errorText: errorBody.email,
                            hintText: "Email",
                            onChanged: (value) => _handleFormChange(context),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BaseTextFormField(
                            enabled: isEditing,
                            controller: _phoneController,
                            icon: Icons.phone_android,
                            hintText: "Phone Number",
                            textInputType: TextInputType.number,
                            errorText: errorBody.phoneNo,
                            onChanged: (value) => _handleFormChange(context),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (isEditing) {
                                final _selectedDOB = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime.now());

                                if (_selectedDOB != null) {
                                  _dob = formatDate(_selectedDOB);
                                }
                                _handleFormChange(context);
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              height: 68,
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
                                context.read<EditProfileBloc>().add(
                                      EditButtonClickedEditProfileEvent(
                                          isEditing: isEditing),
                                    );
                              },
                              text: "EDIT PROFILE",
                            ),
                          if (isEditing)
                            WhiteBackgroundRedTextElevatedButton(
                              onPressed: () {
                                if (state is InvalidInputEditProfileState ||
                                    state is InitializeEditProfileState) {
                                  String message =
                                      "Please fill form details correctly";
                                  if (_dob == "DOB" &&
                                      state is InvalidInputEditProfileState) {
                                    message = "Please Select DOB";
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(message),
                                    ),
                                  );

                                  return;
                                }
                              },
                              text: "SUBMIT",
                            ),
                        ],
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
                    marginEdgeInsects:
                        const EdgeInsets.symmetric(horizontal: 0),
                  )
              ],
            );
          }),
        ),
      ),
    );
  }

  void _handleFormChange(BuildContext context) {
    BlocProvider.of<EditProfileBloc>(context).add(
      InputChangeEditProfileEvent(
        body: EditProfileBodyEntity(
          phoneNo: _phoneController.text,
          email: _emailController.text,
          lastName: _lastNameController.text,
          firstName: _firstNameController.text,
          dob: _dob,
        ),
      ),
    );
  }
}
