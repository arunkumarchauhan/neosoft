import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/utils/constants.dart';

class WhiteBackgroundRedTextElevatedButton extends StatelessWidget {
  const WhiteBackgroundRedTextElevatedButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.marginEdgeInsects})
      : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final EdgeInsetsGeometry? marginEdgeInsects;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: 65,
      margin: marginEdgeInsects ??
          EdgeInsets.only(
            top: 50.h,
            bottom: 40.h,
            left: 40.h,
            right: 40.h,
          ),
      child: ElevatedButton(
        style: ButtonStyle(
            minimumSize:
                MaterialStateProperty.all<Size>(Size(double.infinity, 160.h))),
        onPressed: onPressed,
        child: Text(
          text,
          style: kRedButtonTextStyle,
        ),
      ),
    );
  }
}
