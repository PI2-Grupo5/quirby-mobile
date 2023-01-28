import 'package:flutter/material.dart';

class QuirbyButton extends StatelessWidget {
  final String text;
  final double width;
  final void Function() action;
  Widget? buttonIcon;
  QuirbyButton(
      {super.key,
      required this.text,
      required this.width,
      this.buttonIcon,
      required this.action});

  @override
  Widget build(BuildContext context) {
    if (buttonIcon != null) {
      return ElevatedButton.icon(
        onPressed: action,
        label: Text(text),
        icon: buttonIcon!,
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff81D460),
            fixedSize: Size(width, 30)),
      );
    } else {
      return ElevatedButton(
          onPressed: action,
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff81D460),
              fixedSize: Size(width, 30)),
          child: Text(text));
    }
  }
}
