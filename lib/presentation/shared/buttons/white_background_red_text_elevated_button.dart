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
      height: 65,
      margin: marginEdgeInsects ??
          const EdgeInsets.only(
            top: 16,
            bottom: 16,
            left: 15,
            right: 15,
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
