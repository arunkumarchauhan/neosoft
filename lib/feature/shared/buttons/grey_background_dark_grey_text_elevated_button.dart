import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/utils/colors.dart';
import 'package:neostore/utils/constants.dart';

class GreyBackgroundDarkGreyTextElevatedButton extends StatelessWidget {
  const GreyBackgroundDarkGreyTextElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      margin: EdgeInsets.only(
        top: 50.h,
        bottom: 40.h,
        left: 40.h,
        right: 40.h,
      ),
      child: Theme(
        data: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(kLightGreyColor),
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(color: kDarkGreyColor, width: 1),
              ),
            ),
          ),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: kWhiteButtonTextStyle.copyWith(color: kDarkGreyColor),
          ),
        ),
      ),
    );
  }
}
