import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final String? fontFamily;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final TextStyle? style;
  const TextWidget(
      {super.key,
      this.text,
      this.fontFamily,
      this.fontSize,
      this.color,
      this.textAlign,
      this.fontWeight,
      this.decoration,
      this.overflow,
      this.style});

  @override
  Widget build(BuildContext context) {
    return Text(text.toString(),
        textAlign: textAlign, overflow: overflow, style: style);
  }
}
