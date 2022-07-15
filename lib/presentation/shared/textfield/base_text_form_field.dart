import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseTextFormField extends StatelessWidget {
  BaseTextFormField({
    Key? key,
    this.icon,
    this.errorText,
    this.validator,
    this.hintText,
    this.textInputType,
    this.controller,
    this.obscureText,
    this.textColor,
    this.enabled = true,
    this.onChanged,
  }) : super(key: key);
  final String? errorText;
  final IconData? icon;
  final Function(String? str)? validator;
  final String? hintText;
  bool? obscureText;
  TextEditingController? controller;
  TextInputType? textInputType;
  Color? textColor;
  bool enabled;
  Function(String? value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        cursorColor: Colors.black,
        enabled: enabled,
        onChanged: onChanged == null ? null : (value) => onChanged!(value),
        style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: "Gotham",
            height: 1.35),
        obscureText: obscureText ?? false,
        validator: validator == null
            ? (String? str) {}
            : (String? str) => validator!(str),
        controller: controller,
        keyboardType: textInputType ?? TextInputType.text,
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
