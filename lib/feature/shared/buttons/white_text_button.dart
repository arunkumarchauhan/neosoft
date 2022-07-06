import 'package:flutter/material.dart';

class WhiteTextButton extends StatelessWidget {
  WhiteTextButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);
  VoidCallback onPressed;
  String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
