import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseTextFormField extends StatelessWidget {
  BaseTextFormField(
      {Key? key,
      this.icon,
      this.errorText,
      this.validator,
      this.hintText,
      this.textInputType,
      this.controller,
      this.obscureText,
      this.textColor})
      : super(key: key);
  final String? errorText;
  final IconData? icon;
  final Function(String? str)? validator;
  final String? hintText;
  bool? obscureText;
  TextEditingController? controller;
  TextInputType? textInputType;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: TextFormField(
        style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: "Gotham"),
        obscureText: obscureText ?? false,
        validator: validator == null
            ? (String? str) {}
            : (String? str) => validator!(str),
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          errorText: errorText,
          prefixIcon: Icon(
            icon,
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
