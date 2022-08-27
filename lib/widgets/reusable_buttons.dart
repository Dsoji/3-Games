import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? width;

  final void Function()? onPressed;

  const Buttons({Key? key, this.width, this.color, this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed!,
      minWidth: width!,
      color: color,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Text(
        text!,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'Messina Sans',
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
