import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/utils/constants.dart';

class WhiteBackgroundRedTextElevatedButton extends StatelessWidget {
  const WhiteBackgroundRedTextElevatedButton({
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
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: kRedButtonTextStyle,
        ),
      ),
    );
  }
}
